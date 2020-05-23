module AuthSessionConcern

    protected 

    def set_current_user
        if session[:user_id]
          @current_user = User.find(session[:user_id])
        else
          @current_user = nil
        end
      end

end