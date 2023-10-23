Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :ceramics, only: [:index, :create, :show, :edit, :update, :destroy]

  namespace :admin do
    resources :ceramics, only: [:new]
  end
root 'ceramics#index'

end
