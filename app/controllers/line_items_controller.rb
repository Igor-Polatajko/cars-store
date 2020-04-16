class LineItemsController < ApplicationController
    include SavedCollectionSessionRetriever

    before_action :set_collection

    def create
        @line_item = LineItem.new(car_record_id: params[:car_record_id], saved_collection: @saved_collection.id)
        
        redirect_to controller: :saved_collections, action: :show
    end

    def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy

        redirect_to controller: :saved_collections, action: :show
    end 

end