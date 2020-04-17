class SavedCollectionsController < ApplicationController
    include SavedCollectionSessionRetriever

    before_action :set_collection

    def show
        @car_records = @saved_collection.line_items.map{ |line_item| line_item.car_record }
    end 

end