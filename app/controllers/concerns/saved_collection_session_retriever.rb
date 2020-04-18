module SavedCollectionSessionRetriever
    protected

    def set_collection
        @saved_collection = SavedCollection.find(session[:saved_collection_id])
        @car_records_in_saved_collection = @saved_collection.line_items.map{ |line_item| line_item.car_record }
    rescue ActiveRecord::RecordNotFound
        @saved_collection = SavedCollection.create
        session[:saved_collection_id] = @saved_collection.id
        @car_records_in_saved_collection = []
    end
end