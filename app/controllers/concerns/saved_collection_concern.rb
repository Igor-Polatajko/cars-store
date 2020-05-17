module SavedCollectionConcern

    protected

    def set_saved_collection

        if @current_user.present? && @current_user.saved_collection.present?
            @saved_collection = @current_user.saved_collection
        else 
            @saved_collection = SavedCollection.find(session[:saved_collection_id])
            
            if @current_user.present?
                @current_user.saved_collection = @saved_collection
            end
        end
       
        @car_records_in_saved_collection = @saved_collection.line_items.map{ |line_item| line_item.car_record }                                    
    rescue ActiveRecord::RecordNotFound
        @saved_collection = SavedCollection.create
        
        if @current_user.present?
            @current_user.saved_collection = @saved_collection
        else
            session[:saved_collection_id] = @saved_collection.id
        end

        @car_records_in_saved_collection = []
    end

end