class SavedCollectionsController < ApplicationController
    require 'will_paginate/array'

    def show     
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