module SavedCollectionSessionRetriever
    protected

    def set_collection
        @saved_collection = SavedCollection.find(session[:saved_collection_id])
    rescue ActiveRecord::RecordNotFound
        @saved_collection = SavedCollection.create
        session[:saved_collection_id] = @saved_collection.id
    end
end