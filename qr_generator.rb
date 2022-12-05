require 'rqrcode'


qr_code = RQRCode::QRCode.new("https://cloudalbum.herokuapp.com/#{@event_number}")

png = qr_code.as_png(
  color: "black",
  fill: "white",
  size: 400
)


# qr_image = qr_code.as_png(
#   fill: "white",
#   color: "black",
#   size: 300
#   )

# logo = ChunkyPNG::Image.from_file("./app/assets/images/blackcloud.png")

# height = (logo.dimension.height).floor - (qr_image.dimension.height).floor
# width  = (logo.dimension.width).floor - (qr_image.dimension.width).floor

# qr_composed = logo.compose(qr_image, width, height)
# qr_composed.save("qr_composed.png")


IO.binwrite("cloudalbum3.png", png.to_s)
