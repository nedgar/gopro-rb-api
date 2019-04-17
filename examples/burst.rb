#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new
gpCamera.shutter(Shutter::OFF)
gpCamera.camera_mode(Mode::MultiShotMode, Mode::SubMode::MultiShot::Burst)
gpCamera.control_set(Multishot::BURST_RATE, Multishot::BurstRate::B5_1)
gpCamera.shutter(Shutter::ON)
