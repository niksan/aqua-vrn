AquaVrn::Application.routes.draw do
  get "pages/show"
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root 'main#index'

  resources :pages, only: :show
  resources :photogallery, only: :index
  resources :contacts, only: :index

end
