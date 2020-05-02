module WebSocketIdentifierCookieSetter
    require 'securerandom'

    protected

    def set_web_socket_identifier_cookie
       if cookies["socket_id"].nil?
          cookies["socket_id"] = SecureRandom.uuid
       end
    end
end