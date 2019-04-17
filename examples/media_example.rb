#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new

puts "Media List"
puts gpCamera.list_media

puts "Last media taken:"
puts gpCamera.get_media

media_info = gpCamera.media_info
puts "Last Media info:"
puts "    filename: " + media_info[:file]
puts "    folder: " + media_info[:folder]
puts "    size: %.2f MB" % (media_info[:size].to_f / 1000000)

puts "Downloading last media"
gpCamera.dl_media()
