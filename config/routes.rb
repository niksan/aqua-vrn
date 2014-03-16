AquaVrn::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root 'main#index'

  resources :pages, only: :show
  resources :photogallery, only: :index
  resources :contacts, only: :index
  resources :services, only: [:index, :show]
  resources :messages, only: :create

end
