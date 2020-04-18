Rails.application.routes.draw do
  root 'main_page#index', as: 'main_page_index'
  resources :car_records
  
  get '/saved_collection', to: 'saved_collections#show', as: 'saved_collection_show'
  delete '/saved_collection', to: 'saved_collections#destroy', as: 'saved_collection'

  post '/line_items', to: 'line_items#create', as: 'line_items_create'
  delete '/line_items/:id', to: 'line_items#destroy_by_car_record_id', as: 'line_items'
end
