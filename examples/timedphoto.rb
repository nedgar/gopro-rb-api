require '../GoPro/GoPro'
require '../GoPro/constants'
gpCamera = Camera.new
sleep 5
gpCamera.take_photo()