#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new
gpCamera.camera_mode(Mode::VideoMode, Mode::SubMode::Video::Video)
gpCamera.control_set(Video::RESOLUTION, Video::Resolution::R1440p)
gpCamera.shutter(Shutter::ON)
