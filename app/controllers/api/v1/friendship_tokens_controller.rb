class API::V1::FriendshipTokensController < APIController
   

    def show
        token = SecureRandom.hex(32)
        
        
        pa = JSON.parse(request.raw_post)
        id_usuario = pa['user_id'].to_i
        latitud = pa['latitude']
        longitud = pa['longitude']
        coordinates = "#{latitud},#{longitud}"
        print(coordinates)
        #Invitation.create(:token => token, :user_id => id_usuario, :coordinates => coordinates)
        #Invitation.where(token: tk).pluck(:created_at)[0]
        base_url = 'http://localhost:3000/api/v1/friendship_tokens/show'
        url_with_token = "#{base_url}?fndtk=#{token}"

        qrcode = RQRCode::QRCode.new(url_with_token)

        # Set the size and margin for the QR code
        size = 200
        margin = 4

        # Create a ChunkyPNG image with the QR code
        png = qrcode.as_png(
        bit_depth: 1,
        border_modules: margin,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        resize_gte_to: false,
        resize_exactly_to: false,
        fill: 'white',
        shape_rendering: 'crisp_edges'
        )

        png_binary = png.to_s

        # Send the QR code data as a response
        send_data(png_binary, type: 'image/png', disposition: 'inline')
        #render :json => {'token': url_with_token}
        #send_data RQRCode::QRCode.new('http://localhost:3000/api/v1/friendship_tokens/show').as_png(size: 300), type: 'image/png', disposition: 'attachment'
    end

end