#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

###################################
# Photogrammetry with GoPro camera#
# Proof of concept, not for real  #
# world usage.                    #
# TIMELAPSE                       #
###################################

INTERVAL = 5  # Interval in seconds

gpCamera = Camera.new
gpCamera.camera_mode(Mode::PhotoMode)
count = 0
while true
  sleep INTERVAL
	gpCamera.shutter(Shutter::ON)
	count += 1
	while gpCamera.status(Status::Status, Status::STATUS::IsBusy) == 1
    puts Time.now.to_f * 1000
	end
end
