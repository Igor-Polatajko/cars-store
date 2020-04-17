class LineItemsController < ApplicationController
    include SavedCollectionSessionRetriever

    before_action :set_collection

    def create
        car_record = CarRecord.find(params[:car_record_id])

        car_records_in_saved_collection = @saved_collection.line_items.map{ |line_item| line_item.car_record }

        if car_records_in_saved_collection.include?(car_record)
            flash[:notice] = "Item is already in your list!"
            return redirect_to controller: :saved_collections, action: :show 
        end

        @saved_collection.line_items.build(car_record: car_record)
        @saved_collection.save

        flash[:notice] = "Added to saved!"
        redirect_to controller: :saved_collections, action: :show
    end

    def destroy
        line_item = LineItem.find(params[:id])
        line_item.destroy

        redirect_to controller: :saved_collections, action: :show
    end 

end