Rails.application.routes.draw do
  get 'user/new', as: 'new_user'
  post 'user/create', as: 'users'
  get 'user/edit', as: 'edit_user'
  put 'user/update'
  delete 'user/destroy'
  
  get 'order_requests/new/:id', to: 'order_request#new', as: 'new_order_request'
  post  '/order_requests', to: 'order_request#create'

  get 'error/show', as: 'error'
  root 'main_page#index', as: 'main_page_index'
  
  resources :car_records
  
  get '/saved_collection', to: 'saved_collections#show', as: 'saved_collection_show'
  delete '/saved_collection', to: 'saved_collections#destroy', as: 'saved_collection'

  post '/line_items', to: 'line_items#create', as: 'line_items_create'
  delete '/line_items/:id', to: 'line_items#destroy_by_car_record_id', as: 'line_items'
end
