#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new
puts gpCamera.status_raw
puts
status = gpCamera.status
puts status[Status::Status][Status::STATUS::Mode]
puts status[Status::Status][Status::STATUS::SubMode]
puts status[Status::Status][Status::STATUS::IsRecording]
puts status[Status::Settings][Video::FRAME_RATE]
puts status[Status::Settings][Photo::RESOLUTION]
info = gpCamera.info_camera
puts info[Camera::Name]
