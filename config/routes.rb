Rails.application.routes.draw do
  root 'main_page#index', as: 'main_page_index'
  resources :car_records
  
  get '/saved_collections', to: 'saved_collections#show', as: 'saved_collection_show'

  post '/line_items', to: 'line_items#create', as: 'line_items_create'
  delete '/line_items/:id', to: 'line_items#destroy', as: 'line_items_delete'
end
