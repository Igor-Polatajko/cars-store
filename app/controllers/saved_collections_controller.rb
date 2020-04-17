class SavedCollectionsController < ApplicationController
    include SavedCollectionSessionRetriever

    before_action :set_collection

    def show
        @car_records = @saved_collection.line_items.map{ |line_item| line_item.car_record }
    end 

    def destroy
        @saved_collection.destroy
        session[:saved_collection_id] = nil
        respond_to do |format|
            format.html { redirect_to saved_collection_show_path, notice: "List has been cleared!" }
            format.json { head :no_content }
        end
    end

end