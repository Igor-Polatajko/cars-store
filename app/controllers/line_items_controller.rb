class LineItemsController < ApplicationController

    def create
        car_record = CarRecord.find(params[:car_record_id])

        if @car_records_in_saved_collection.include?(car_record)
            return respond_after_create("Item is already in your list!")
        end

        @saved_collection.line_items.build(car_record: car_record)
        @saved_collection.save

        respond_after_create("Added to saved!")
    end

    def destroy_by_car_record_id
        car_record = CarRecord.find(params[:id])

        LineItem.destroy_by(car_record: car_record)

        respond_to do |format|
            format.html {
                redirect_to controller: :saved_collections,
                action: :show }
            format.json {
                head :no_content
            }
            format.js {
                head :no_content
            }
        end
    end 

    private 
        def respond_after_create(msg)
            
            if request.format.html?
                flash[:notice] = msg
            end

            respond_to do |format|
                format.html {
                    redirect_to controller: :saved_collections,
                    action: :show }
                format.json {
                    head :ok
                }
                format.js {
                    head :ok
                }
            end
        end

end