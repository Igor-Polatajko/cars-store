Rails.application.routes.draw do
  get 'admin/index', as: 'admin'
  get 'login', to: 'auth_sessions#new', as: 'login'
  post 'login', to: 'auth_sessions#create', as: 'new_session'
  delete 'logout', to: 'auth_sessions#destroy', as: 'logout'
  
  get 'user/new', as: 'new_user'
  post 'user/create', as: 'users'
  get 'user/edit', as: 'edit_user'
  patch 'user/update', as: 'user'
  delete 'user/:id', to: 'user#deactivate', as: 'deactivate_user'
  post 'user/:id', to: 'user#activate', as: 'activate_user'
  get 'user/confirm', to: 'user#confirm_email'
  
  get 'order_requests/new/:id', to: 'order_request#new', as: 'new_order_request'
  match  '/order_requests', to: 'order_request#create', via: [:get, :post]
  get 'order_requests/confirm', to: 'order_request#confirm'
  get 'order_requests/my/created', to: 'order_request#show_current_user_created_order_requests', as: 'current_user_created_order_requests'
  get 'order_requests/my/received', to: 'order_request#show_current_user_received_order_requests', as: 'current_user_received_order_requests'

  get 'error/show', as: 'error'
  root 'main_page#index', as: 'main_page_index'
  
  get 'car_records/my', to: "car_records#show_current_user_car_records", as: 'current_user_car_records'
  resources :car_records
  get 'search', to: "car_records#search", as: 'search'
  
  get '/saved_collection', to: 'saved_collections#show', as: 'saved_collection_show'
  delete '/saved_collection', to: 'saved_collections#destroy', as: 'saved_collection'

  post '/line_items', to: 'line_items#create_in_collection', as: 'line_items_create'
  delete '/line_items/:id', to: 'line_items#destroy_in_collection_by_car_record_id', as: 'line_items'
end
