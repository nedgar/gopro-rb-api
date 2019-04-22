#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

camera = Camera.new
camera.livestream(Livestream::STOP)
camera.livestream(Livestream::START)
begin
  camera.keep_alive do |i|
    if i % 10 == 0
      level = camera.status(Status::Status, Status::STATUS::BatteryLevel)
      reading = camera.parse_value("battery", level)
      puts
      puts "Battery #{reading}"
    else
      print "."
    end
  end
rescue Interrupt => e
  puts "Interrupted", e
  camera.livestream(Livestream::STOP)
end
