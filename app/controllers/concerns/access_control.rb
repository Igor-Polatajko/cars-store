module AccessControl

    protected 

    def guest_only
        if !is_guest
            return redirect_to main_page_index_path
        end
    end

    def user_only
        if is_guest
            return redirect_to main_page_index_path
        end
    end

    def admin_only
        if is_guest || is_not_admin
            return redirect_to main_page_index_path
        end
    end

    def owner_only
        if is_guest || is_not_owner
            return redirect_to main_page_index_path
        end
    end

    def owner_or_admin
        if is_guest || (is_not_owner && is_not_admin)
            return redirect_to main_page_index_path
        end
    end

    private 

    def is_guest
        @current_user.nil?
    end

    def is_not_admin
        !@current_user.is_admin
    end

    def is_not_owner
        car_records_ids_of_current_user = @current_user.car_records.pluck(:id)
        params[:id].nil? || car_records_ids_of_current_user.exclude?(params[:id].to_i)
    end

end