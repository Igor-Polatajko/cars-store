class ApplicationController < ActionController::Base
    include SavedCollectionSessionRetriever
    include WebSocketIdentifierCookieSetter
    before_action :set_collection, :set_web_socket_identifier_cookie
    
    #rescue_from Exception, :with => :handle_exception

    def handle_exception(error)
      logger.error(error.message)

      if error.class == ActiveRecord::RecordNotFound
        flash[:error] = "Requested resource not found!"
      else
        flash[:error] = "Internal service error!"
      end
      redirect_to error_path
    end

end
