module AccessControl

    protected 

    def logout_inactive_user
        if @current_user.present? && !@current_user.active
            session[:user_id] = nil
            flash[:alert] = "Your account was deactivated!"
            redirect_to login_path
        end
    end

    def guest_only
        if !is_guest
            return redirect_to main_page_index_path
        end
    end

    def user_only
        if is_guest
            return redirect_to login_path
        end
    end

    def admin_only
        if !is_admin
            return redirect_to login_path
        end
    end

    def owner_only
        if !is_owner(params[:id])
            return redirect_to login_path
        end
    end

    def owner_or_admin
        if !is_owner(params[:id]) && !is_admin
            return redirect_to login_path
        end
    end

    def is_guest
        @current_user.nil?
    end

    def is_admin
        !is_guest && @current_user.is_admin
    end

    def is_owner(car_record_id)

        if is_guest
            return false
        end

        CarRecord.unscoped do
            car_records_ids_of_current_user = @current_user.car_records.pluck(:id)
            !car_record_id.nil? && car_records_ids_of_current_user.include?(car_record_id.to_i)
        end
    end

end