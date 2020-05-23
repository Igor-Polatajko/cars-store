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
  
  get 'order_requests/new/:id', to: 'order_request#new', as: 'new_order_request'
  match  '/order_requests', to: 'order_request#create', via: [:get, :post]
  get 'order_requests/confirm/:token', to: 'order_request#confirm'

  get 'error/show', as: 'error'
  root 'main_page#index', as: 'main_page_index'
  
  resources :car_records
  
  get '/saved_collection', to: 'saved_collections#show', as: 'saved_collection_show'
  delete '/saved_collection', to: 'saved_collections#destroy', as: 'saved_collection'

  post '/line_items', to: 'line_items#create_in_collection', as: 'line_items_create'
  delete '/line_items/:id', to: 'line_items#destroy_in_collection_by_car_record_id', as: 'line_items'
end
