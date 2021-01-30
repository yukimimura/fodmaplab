Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'homes#top'
  get 'foods/index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    collection do
      get :search
    end
  end
  resources :users, only: [:show, :destroy]
  resources :articles, only: [:index, :show]
  
end