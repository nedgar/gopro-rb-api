#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new
sleep 5
gpCamera.take_photo()
