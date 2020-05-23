module AccessControl

    protected 

    def guest_only
        if @current_user.present?
            return redirect_to main_page_index_path
        end
    end

    def user_only
        if @current_user.nil?
            return redirect_to main_page_index_path
        end
    end

    def admin_only
        user_only

        if is_not_admin
            return redirect_to main_page_index_path
        end
    end

    def owner_only
        user_only

        car_records_ids_of_current_user = @current_user.car_records.pluck(:id)
        if is_not_owner
            return redirect_to main_page_index_path
        end
    end

    def owner_or_admin
        if is_not_admin || is_not_owner
            return redirect_to main_page_index_path
        end
    end

    private 

    def is_not_admin
        return !@current_user.is_admin
    end

    def is_not_owner
        return params[:id].nil? || !car_records_ids_of_current_user.exclude?(params[:id])
    end

end