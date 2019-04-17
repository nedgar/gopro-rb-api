#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new
brackets = ["0","4","8"]
brackets.each_with_index do |bracket, count|
	gpCamera.gpControlSet(Photo::EVCOMP, bracket)
	puts "Photo: #{count}"
	sleep 1
	gpCamera.shutter(Shutter::ON)
	sleep 1
end
