class ApplicationController < ActionController::Base
    include SavedCollectionSessionRetriever
    before_action :set_collection
    
end
