#!/usr/bin/env ruby -w
require_relative '../lib/goprocam'
require_relative '../lib/constants'

gpCamera = Camera.new
gpCamera.livestream(Livestream::STOP)
