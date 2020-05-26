class ApplicationController < ActionController::Base
    include AuthSessionConcern
    include SavedCollectionConcern
    include WebSocketIdentifierCookieSetter
    include AccessControl

    before_action :set_current_user, :logout_inactive_user, :set_saved_collection, :set_web_socket_identifier_cookie
    helper_method :is_admin, :is_owner, :is_guest
    
    #rescue_from Exception, with: :handle_exception
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_exception

    def handle_exception(error)
      logger.error(error.message)

      if error.class == ActiveRecord::RecordNotFound
        flash[:error] = "Requested resource not found!"
      else
        flash[:error] = "Internal service error!"
      end
      redirect_to error_path
    end

    
    def handle_not_found_exception(error)
      logger.error(error.message)
      redirect_to main_page_index_path
    end

end
