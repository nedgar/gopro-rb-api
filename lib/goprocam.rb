# frozen_string_literal: true

require 'open-uri'
require 'socket'
require 'json'
require_relative 'constants'

GPIP = "10.5.5.9"
GOPROCONTROL = "http://#{GPIP}/gp/gpControl/"
GOPROMEDIA = "http://#{GPIP}/gp/gpMediaList/"
GOPRO_STREAMING_PORT = 8554

DEBUG = true

class Camera
	def initialize
		# check if camera is ON:
		# power_on
		# check if camera status is connected

		# wait_to_connect
	end

	def wait_to_connect(delay_secs = 0.1)
		while status(Status::Status, Status::STATUS::IsConnected) == 0
			sleep delay_secs
		end
	end

	def control_set(param, value)
		response = gp_control('setting', param, value)
		debug response
	end

	def control_command(*path)
		response = gp_control('command', *path)
		debug response
	end

	# for backwards compatibility
	alias_method :gpControlSet, :control_set
	alias_method :gpControlCommand, :control_command

	def status_raw
		response = gp_control('status')
		# debug response
    response
	end

	def status(value = nil, param = nil)
		response = gp_control_json('status')
		# debug response
		status = if value && param
			response[value][param]
		elsif value
			response[value]
		else
			response
		end
		# debug status
		status
	end

	def info_camera(option = nil)
		response = gp_control_json('info')
		info = response['info']
		option ? info[option] : info
	end

	def parse_value(param, value)
		# debug "parse_value #{param}, #{value}"
		case param
			when "mode"
				case value
					when 0
						"Video"
					when 1
						"Photo"
					when 2
						"Multi-Shot"
				end
			when "sub_mode"
				# TODO: pass in both mode and sub_mode values instead of issuing a request here
				case status(Status::Status, Status::STATUS::Mode)
					when 0
						case value
							when 0
								"Video"
							when 1
								"TimeLapse Video"
							when 2
								"Video+Photo"
							when 3
								"Looping"
						end
					when 1
						case value
							when 0
								"Single Pic"
							when 1
								"Burst"
							when 2
								"NightPhoto"
						end
					when 2
						case value
							when 0
								"Burst"
							when 1
								"TimeLapse"
							when 2
								"Night lapse"
						end
				end
			when "recording"
				case value
					when 0
						"Not recording - standby"
					when 1
						"RECORDING!"
				end
			when "battery"
				case value
					when 0
						"Nearly Empty!"
					when 1
						"Low"
					when 2
						"Halfway"
					when 3
						"Full"
					when 4
						"Charging"
				end
			when "video_left"
				Time.at(value).utc.strftime("%H:%M:%S")
			when "rem_space"
				"%.2f" % (value.to_f / 1e6)
			when "video_res"
				case value
					when 1
						"4k"
					when 2
						"4kSV"
					when 3
						"1440p"
					when 4
						"2k"
					when 5
						"2kSV"
					when 6
						"2k4by3"
					when 7
						"1440p"
					when 8
						"1080pSV"
					when 9
						"1080p"
					when 10
						"960p"
					when 11
						"720pSV"
					when 12
						"720p"
					when 13
						"480p"
				end
			when "video_fr"
				case value
					when 0
						"240"
					when 1
						"120"
					when 2
						"100"
					when 5
						"60"
					when 6
						"50"
					when 7
						"48"
					when 8
						"30"
					when 9
						"25"
					when 10
						"24"
				end
		end
	end

	def overview
		combined_status = self.status
		# debug JSON.pretty_generate(combined_status)

		status = combined_status[Status::Status]
		settings = combined_status[Status::Settings]
		info_camera = self.info_camera

		puts "Camera overview:"
		[
			["current mode", parse_value("mode", status[Status::STATUS::Mode])],
			["current submode", parse_value("sub_mode", status[Status::STATUS::SubMode])],
			["current video resolution", parse_value("video_res", settings[Video::RESOLUTION])],
			["current video framerate", parse_value("video_fr", settings[Video::FRAME_RATE])],
			["photos taken", status[Status::STATUS::PhotosTaken].to_s],
			["batch photos taken", status[Status::STATUS::BatchPhotosTaken].to_s],
			["videos taken",  status[Status::STATUS::VideosTaken].to_s],
			["video time left", parse_value("video_left", status[Status::STATUS::RemVideoTime])],
			["pictures left", status[Status::STATUS::RemPhotos].to_s],
			["battery left", parse_value("battery", status[Status::STATUS::BatteryLevel])],
			["space left on SD (GBs)", parse_value("rem_space", status[Status::STATUS::RemainingSpace])],
			["camera name", status[Status::STATUS::CamName].to_s],
			["is recording", parse_value("recording", status[Status::STATUS::IsRecording])],
			["clients connected", status[Status::STATUS::IsConnected].to_s],
			["camera model", info_camera[Camera::Name]],
			["camera SSID", info_camera[Camera::SSID]],
			["firmware version", info_camera[Camera::Firmware]],
			["serial number", info_camera[Camera::SerialNumber]]
		].each do |label, value|
			puts label + ": ", "    #{value}"
		end
	end

	def shutter(value)
		control_command('shutter?p=' + value)
	end

	def take_photo
		if status(Status::Status, Status::STATUS::IsRecording) == "1"
			shutter(Shutter::OFF)
		end
		camera_mode(Mode::PhotoMode)
		shutter(Shutter::ON)
	end

	def camera_mode(mode, submode = 0)
		control_command("sub_mode?mode=#{mode}&sub_mode=#{submode}")
	end

	def delete(option)
		control_command('storage', 'delete', option)
	end

	def delete_file(folder, file)
		# TODO: URI-encode folder/file path
		control_command('storage', "delete?p=#{folder}/#{file}")
	end

	def locate(param)
		control_command('system', "locate?p=#{param}")
	end

	def hilight
		control_command('storage', 'tag_moment')
	end

	def power_off
		control_command('system', 'sleep')
	end

	def ap_setting(ssid, passwd)
		control_command('wireless', 'ap', "ssid?ssid=#{ssid}&pw=#{passwd}")
	end

	def reset(option)
		#videoPT, photoPT, msPT, camera, etc...
		case option
			when Reset::VideoPT
				#reset video PT
				control_command('video', 'protune', 'reset')
			when Reset::PhotoPT
				#reset photo PT
				control_command('photo', 'protune', 'reset')
			when Reset::MultiShotPT
				#reset Ms PT
				control_command('multi_shot', 'protune', 'reset')
			when Reset::CamReset
				control_command('system', 'factory', 'reset')
		end
	end

	def list_media
		JSON.pretty_generate gp_media_json
	end

	def get_media
		info = media_info
		"http://#{GPIP}:8080/videos/DCIM/#{info[:folder]}/#{info[:file]}"
	end

	def media_info
		response = gp_media_json
		entry = response['media'].last
		{
			folder: entry && entry['d'],
			file: entry && entry['fs'].last['n'],
			size: entry && entry['fs'].last['s']
		}
	end

	def get_media_info(option)
		media_info[option.to_sym]
	end

	def sync_time(t = Time.new)
		datestr = [t.year % 100, t.month, t.day, t.hour, t.min, t.sec].map { |v| '%' + v.to_s(16) }.join('')
		control_command('setup', 'date_time?p=' + datestr)
	end

	def dl_media
		info = media_info
		filename = "#{info[:folder]}-#{info[:file]}"
		url = get_media
		open(url) do |src|
			File.open(filename, 'wb') do |dest|
				IO.copy_stream(src, dest)
			end
		end
	end

	def livestream(option)
		case option
		when Livestream::START, Livestream::STOP,  Livestream::RESTART
			_response = gp_control_json('execute?p1=gpStream&a1=proto_v2&c1=' + option)
			# debug _response
		end
	end

	KEEP_ALIVE_MSG = ("_GPHD_:%u:%u:%d:%.6f\n" % [0, 0, 2, 0]).encode('UTF-8')

	def keep_alive(sleep_ms = 2500)
		socket = UDPSocket.new
		# socket.connect(GPIP, GOPRO_STREAMING_PORT)
		i = 0
		while true
			socket.send(KEEP_ALIVE_MSG, 0, GPIP, GOPRO_STREAMING_PORT)
			if block_given?
				yield i
			else
				print "."
			end
			sleep sleep_ms / 1000.0
			i += 1
		end
	end

	private

	def debug(msg)
		puts msg if DEBUG
	end

	def gp_control(*path)
    # debug path.join('/')
		open(GOPROCONTROL + path.join('/')).read
	end

	def gp_control_json(*path)
		response = gp_control(*path)
		JSON.parse(response)
	end

	def gp_media_json
		response = open(GOPROMEDIA).read
		JSON.parse(response)
	end
end
