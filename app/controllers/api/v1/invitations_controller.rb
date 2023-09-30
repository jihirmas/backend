class API::V1::InvitationsController < APIController
    def ct
        token = SecureRandom.hex(8)
        #render :json => {'token': token}
        return token
    end

    def cqr
        token = ct
        
        render :json => {'token': token}
    end
    
end