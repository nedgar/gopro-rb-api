module Status
	Status = 'status'
	Settings = 'settings'

	module STATUS
		Battery = "1"
		BatteryLevel = "2"
		IsBatteryBacPac = "3"
		BatteryBacPacLevel = "4"
		QuikCapture = "9"
		IsBusy = "8"
		Mode = "43"
		SubMode = "44"
		RecordElapsed = "13"
		CamName = "30"
		RemVideoTime = "35"
		RemPhotos = "34"
		BatchPhotosTaken = "36"
		VideosTaken = "39"
		PhotosTaken = "38"
		IsRecording = "8"
		RemainingSpace = "54"
		TotalHiLights = "58"
		LastHiLight = "59"
		SdCardInserted = "33"
		IsConnected = "31"
		GPS = "68"
		BattPercent = "70"
	end
end

class Camera
	Name = 'model_name'
	Number = 'model_number'
	Firmware = 'firmware_version'
	SSID = 'ap_ssid'
	MacAddress = 'ap_mac'
	SerialNumber = 'serial_number'
end

module Mode
	VideoMode = "0"
	PhotoMode = "1"
	MultiShotMode = "2"

	module SubMode
		module Video
			Video = "0"
			TimeLapseVideo = "1"
			VideoPhoto = "2"
			Looping = "3"
		end

		module Photo
			Single = "0"
			Continuous = "1"
			Night = "2"
		end

		module MultiShot
			Burst = "0"
			TimeLapse = "1"
			NightLapse = "2"
		end
	end
end

module Shutter
	ON = "1"
	OFF = "0"
end

module Delete
	ALL = 'all'
	LAST = 'last'
end

module Locate
	Start = "1"
	Stop = "0"
end

module Reset
	VideoPT = 'video'
	PhotoPT = 'photo'
	MultiShotPT = 'multishot'
	CamReset = 'camera'
end

module Setup
	ORIENTATION = "52"

	module Orientation
		Up = "1"
		Down = "2"
		Auto = "0"
	end

	QUIK_CAPTURE = "54"

	module QuikCapture
		ON = "1"
		OFF = "2"
	end

	LED_BLINK = "55"

	module LedBlink
		Led_OFF = "0"
		Led_2 = "1"
		Led_4 = "2"
	end

	LED_BLINK_H5 = "92"

	module LedBlinkH5
		Led_OFF = "0"
		Led_ON = "2"
		Led_FrontOff = "1"
	end

	BEEP = "56"

	module Beep
		OFF = "2"
		SemiLoud = "1"
		Loud = "0"
	end

	AUTO_OFF = "59"

	module AutoOff
		Never = "0"
		A1Min = "1"
		A2Min = "2"
		A3Min = "3"
	end

	GPS = "83"

	module MapLocate
		ON = "1"
		OFF = "0"
	end

	VOICE_CONTROL = "86"

	module VoiceControl
		ON = "1"
		OFF = "0"
	end

	WIFI = "63"

	module Wifi
		Remote = "2"
		SmartRemote = "3"
		OFF = "0"
	end
end

module Video
	RESOLUTION = "2"

	module Resolution
		R4k = "1"
		R4kSV = "2"
		R2k = "4"
		R2kSV = "5"
		R2k4by3 = "6"
		R1440p = "7"
		R1080pSV = "8"
		R1080p = "9"
		R960p = "10"
		R720pSV = "11"
		R720p = "12"
		R480p = "13"
	end

	FRAME_RATE = "3"

	module FrameRate
			FR240 = "0"
			FR120 = "1"
			FR100 = "2"
			FR60 = "5"
			FR50 = "6"
			FR48 = "7"
			FR30 = "8"
			FR25 = "9"
			FR24 = "10"
	end

	FOV = "4"

	module Fov
		Wide = "0"
		Medium = "1"
		Narrow = "2"
		SuperView = "3"
		Linear = "4"
	end

	LOW_LIGHT = "5"

	module LowLight
		ON = "1"
		OFF = "0"
	end

	SPOT_METER = "9"

	module SpotMeter
		ON = "1"
		OFF = "0"
	end

	VIDEO_LOOP_TIME = "6"

	module VideoLoopTime
		LoopMax = "0"
		Loop5Min = "1"
		Loop20Min = "2"
		Loop60Min = "3"
		Loop120Min = "4"
	end

	VIDEO_PHOTO_INTERVAL = "7"

	module VideoPhotoInterval
		Interval5Min = "1"
		Interval10Min = "2"
		Interval30Min = "3"
		Interval60Min = "4"
	end

	VIDEO_EIS = "78"

	module VideoEIS
		ON = "1"
		OFF = "0"
	end

	PROTUNE_AUDIO = "79"

	module ProtuneAudio
		ON = "1"
		OFF = "0"
	end

	AUDIO_MODE = "80"

	module AudioMode
		Stereo = "0"
		Wind = "1"
		Auto = "2"
	end

	PROTUNE_VIDEO = "10"

	module ProTune
		ON = "1"
		OFF = "0"
	end

	WHITE_BALANCE = "11"

	module WhiteBalance
		WBAuto = "0"
		WB3000k = "1"
		WB4000k = "5"
		WB4800k = "6"
		WB5500k = "2"
		WB6000k = "7"
		WB6500k = "3"
		WBNative = "4"
	end

	COLOR = "12"

	module Color
		GOPRO = "0"
		Flat = "1"
	end

	ISO_LIMIT = "13"

	module IsoLimit
		ISO6400= "0"
		ISO1600= "1"
		ISO400= "2"
		ISO3200= "3"
		ISO800= "4"
		ISO200= "7"
		ISO100= "8"
	end

	ISO_MODE = "74"

	module IsoMode
		Max = "0"
		Lock = "1"
	end

	SHARPNESS = "14"

	module Sharpness
		High = "0"
		Med = "1"
		Low = "2"
	end

	EVCOMP = "15"

	module EvComp
		P2= "0"
		P1_5 = "1"
		P1= "2"
		P0_5 = "3"
		Zero = "4"
		M0_5 = "5"
		M1= "6"
		M1_5 = "7"
		M2= "8"
	end
end

module Photo
	RESOLUTION = "17"

	module Resolution
		R12W = "0"
		R7W = "1"
		R7M = "2"
		R5W = "3"
		#HERO5 black only
		R12L = "10"
		R12M = "8"
		R12N = "9"
	end

	SPOT_METER = "20"

	module SpotMeter
		ON = "1"
		OFF = "0"
	end

	NIGHT_PHOTO_EXP = "19"

	module NightPhotoExp
		ExpAuto = "0"
		Exp2Sec = "1"
		Exp5Sec = "2"
		Exp10Sec = "3"
		Exp15Sec = "4"
		Exp20Sec = "5"
		Exp30Sec = "6"
	end

	CONTINUOUS_PHOTO_RATE = "18"

	module ContinuousPhotoRate
		P3 = "0"
		P5 = "1"
		P10 = "2"
	end

	WDR_PHOTO = "77"

	module WDR
		ON = "1"
		OFF = "0"
	end

	RAW_PHOTO = "82"

	module RawPhoto
		ON = "1"
		OFF = "0"
	end

	PROTUNE_PHOTO = "21"

	module ProTune
		ON = "1"
		OFF = "0"
	end

	WHITE_BALANCE = "22"

	module WhiteBalance
		WBAuto = "0"
		WB3000k = "1"
		WB4000k = "5"
		WB4800k = "6"
		WB5500k = "2"
		WB6000k = "7"
		WB6500k = "3"
		WBNative = "4"
	end

	COLOR = "23"

	module Color
		GOPRO = "0"
		Flat = "1"
	end

	ISO_LIMIT = "24"

	module IsoLimit
		ISO800 = "0"
		ISO400 = "1"
		ISO200 = "2"
		ISO100 = "3"
	end

	ISO_MIN = "75"

	module IsoMin
		ISO800 = "0"
		ISO400 = "1"
		ISO200 = "2"
		ISO100 = "3"
	end

	SHARPNESS = "25"

	module Sharpness
		High = "0"
		Med = "1"
		Low = "2"
	end

	EVCOMP = "26"

	module EvComp
		P2= "0"
		P1_5 = "1"
		P1= "2"
		P0_5 = "3"
		Zero = "4"
		M0_5 = "5"
		M1= "6"
		M1_5 = "7"
		M2= "8"
	end
end

module Multishot
	RESOLUTION = "28"

	module Resolution
		R12W = "0"
		R7W = "1"
		R7M = "2"
		R5W = "3"
		#HERO5 black only
		R12L = "10"
		R12M = "8"
		R12N = "9"
	end

	SPOT_METER = "33"

	module SpotMeter
		ON = "1"
		OFF = "0"
	end

	NIGHT_LAPSE_EXP = "31"

	module NightLapseExp
		ExpAuto = "0"
		Exp2Sec = "1"
		Exp5Sec = "2"
		Exp10Sec = "3"
		Exp15Sec = "4"
		Exp20Sec = "5"
		Exp30Sec = "6"
	end

	NIGHT_LAPSE_INTERVAL = "32"

	module NightLapseInterval
		IContinuous = "0"
		I4s = "4"
		I5s = "5"
		I10s = "10"
		I15s = "15"
		I20s = "20"
		I30s = "30"
		I1m = "60"
		I2m = "120"
		I5m = "300"
		I30m = "1800"
		I60m = "3600"
	end

	TIMELAPSE_INTERVAL = "30"

	module TimeLapseInterval
		IHalf1 = "0"
		I1 = "1"
		I2 = "2"
		I5 = "5"
		I10 = "10"
		I30 = "30"
		I60 = "60"
	end

	BURST_RATE = "29"

	module BurstRate
		B3_1 = "0"
		B5_1 = "1"
		B10_1 = "2"
		B10_2 = "3"
		B10_3 = "4"
		B30_1 = "5"
		B30_2 = "6"
		B30_3 = "7"
		B30_6 = "8"
	end

	PROTUNE_MULTISHOT = "21"

	module ProTune
		ON = "1"
		OFF = "0"
	end

	WHITE_BALANCE = "35"

	module WhiteBalance
		WBAuto = "0"
		WB3000k = "1"
		WB4000k = "5"
		WB4800k = "6"
		WB5500k = "2"
		WB6000k = "7"
		WB6500k = "3"
		WBNative = "4"
	end

	COLOR = "36"

	module Color
		GOPRO = "0"
		Flat = "1"
	end

	ISO_LIMIT = "37"

	module IsoLimit
		ISO800 = "0"
		ISO400 = "1"
		ISO200 = "2"
		ISO100 = "3"
	end

	ISO_MIN = "76"

	module IsoMin
		ISO800 = "0"
		ISO400 = "1"
		ISO200 = "2"
		ISO100 = "3"
	end

	SHARPNESS = "38"

	module Sharpness
		High = "0"
		Med = "1"
		Low = "2"
	end

	EVCOMP = "39"

	module EvComp
		P2 = "0"
		P1_5 = "1"
		P1 = "2"
		P0_5 = "3"
		Zero = "4"
		M0_5 = "5"
		M1 = "6"
		M1_5 = "7"
		M2 = "8"
	end
end

module Livestream
	RESTART = 'restart'
	START = 'start'
	STOP = 'stop'
end
