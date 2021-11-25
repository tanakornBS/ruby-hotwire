Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # get 'storages/index'
  # get 'storages/show'
  # get 'storages/new'
  # get 'storages/edit'

  get 'storages/search'

  resources :storages
  
  root to:"storages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
