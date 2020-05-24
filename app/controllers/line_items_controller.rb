class LineItemsController < ApplicationController

    def create_in_collection
        car_record_id = params[:car_record_id]
        car_record = CarRecord.find(car_record_id)

        if @car_records_in_saved_collection.count >= MAX_ITEMS_IN_COLLECTION
            return respond_after_create(WARN_ACTION, 
                "You can have up to #{MAX_ITEMS_IN_COLLECTION} items in saved collection!", car_record_id)
        end

        if @car_records_in_saved_collection.include?(car_record)
            return respond_after_create(WARN_ACTION, "Item is already in your list!", car_record_id)
        end

        @saved_collection.line_items.build(car_record: car_record)
        @saved_collection.save

        @car_records_in_saved_collection.append(car_record)

        respond_after_create(SAVE_ACTION, "Added to saved!", car_record_id)
    end

    def destroy_in_collection_by_car_record_id
        car_record_id = params[:id]
        car_record = CarRecord.unscoped.find(car_record_id)

        @saved_collection.line_items.destroy_by(car_record: car_record)

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

            push_notification(car_record_id, UNSAVE_ACTION, "Removed from saved!")
        end
    end 

    private 
        def respond_after_create(action, message, record_id)

            respond_to do |format|
                format.html {
                    redirect_to controller: :saved_collections,
                    action: :show }
                format.json {
                    head :created
                }
                format.js {
                    head :created
                }

                push_notification(record_id, action, message)
            end
        end

        def push_notification(record_id, action, message)
            ActionCable.server.broadcast("saved_collection_listing_updates_#{cookies[:socket_id]}",
            html: render_to_string("shared/_car_records_saved_collection_listing",
             :formats => [:html], 
             :layout => false, 
             :locals => {:car_records => @car_records_in_saved_collection}))

             ActionCable.server.broadcast("save_unsave_updates_#{cookies[:socket_id]}",
              record_id: record_id, action: action, message: message)
        end

        private
            MAX_ITEMS_IN_COLLECTION = 3
            WARN_ACTION = 'warn'
            SAVE_ACTION = 'save'
            UNSAVE_ACTION = 'unsave'
end