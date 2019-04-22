#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

# While running, can stream video from UDP port 8554, e.g. using:
# ffplay -loglevel info -fflags nobuffer -f:v mpegts -probesize 8192 'udp://:8554'

camera = Camera.new
camera.livestream(Livestream::STOP)
camera.livestream(Livestream::START)
begin
  camera.keep_alive do |i|
    if i % 24 == 0
      status = camera.status(Status::Status)
      level = camera.parse_value("battery", status[Status::STATUS::BatteryLevel])
      pct = status[Status::STATUS::BattPercent]
      puts if i != 0
      print "Battery #{level} (%d%%)" % pct
    else
      print "."
    end
  end
rescue Interrupt => e
  puts "Interrupted", e
  camera.livestream(Livestream::STOP)
end
