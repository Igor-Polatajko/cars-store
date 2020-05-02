class LineItemsController < ApplicationController

    def create
        car_record_id = params[:car_record_id]
        car_record = CarRecord.find(car_record_id)

        if @car_records_in_saved_collection.include?(car_record)
            return respond_after_create("Item is already in your list!", car_record_id)
        end

        @saved_collection.line_items.build(car_record: car_record)
        @saved_collection.save

        @car_records_in_saved_collection.append(car_record)

        respond_after_create("Added to saved!", car_record_id)
    end

    def destroy_by_car_record_id
        car_record_id = params[:id]
        car_record = CarRecord.find(car_record_id)

        LineItem.destroy_by(car_record: car_record)

        @car_records_in_saved_collection.delete(car_record)

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

            push_notification(car_record_id, "unsave")
        end
    end 

    private 
        def respond_after_create(msg, record_id)
            
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

                push_notification(record_id, "save")
            end
        end

        def push_notification(record_id, action)
            ActionCable.server.broadcast("saved_collection_listing_updates_#{cookies[:socket_id]}",
            html: render_to_string("shared/_car_records_saved_collection_listing",
             :formats => [:html], 
             :layout => false, 
             :locals => {:car_records => @car_records_in_saved_collection}))

             ActionCable.server.broadcast("save_unsave_updates_#{cookies[:socket_id]}",
              record_id: record_id, action: action)
        end

end