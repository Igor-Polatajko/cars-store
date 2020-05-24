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
        if is_guest || !is_admin
            return redirect_to main_page_index_path
        end
    end

    def owner_only
        if is_guest || !is_owner(params[:id])
            return redirect_to main_page_index_path
        end
    end

    def owner_or_admin
        if is_guest || (!is_owner(params[:id]) && !is_admin)
            return redirect_to main_page_index_path
        end
    end

    def is_guest
        @current_user.nil?
    end

    def is_admin
        @current_user.is_admin
    end

    def is_owner(car_record_id)
        car_records_ids_of_current_user = @current_user.car_records.pluck(:id)
        !car_record_id.nil? && car_records_ids_of_current_user.include?(car_record_id.to_i)
    end

end