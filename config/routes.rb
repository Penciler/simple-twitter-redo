Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # 請依照專案指定規格來設定路由
  root "tweets#index"
  resources :tweets, only: [:create, :index] do

    resources :replies, only: [:create, :index]
  end

  resources :users, only: [:edit] do
    member do
      get :tweets
      get :followings
      get :followers
      get :likes
    end
  end

  resources :followships, only: [:create, :destroy]

  namespace :admin do
    resources :tweets, only: [:index, :destroy]
    resources :users, only: [:index]
  end
  
end
