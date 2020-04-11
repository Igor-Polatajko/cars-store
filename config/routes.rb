Rails.application.routes.draw do
  root 'main_page#index', as: 'main_page_index'
  resources :car_records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
