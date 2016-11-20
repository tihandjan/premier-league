Rails.application.routes.draw do

  root 'main#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # authentication start
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :users do
    get 'omniauth_callbacks/facebook'
    get 'omniauth_callbacks/google_oauth2'
  end
  # authentication end

  resources :users, only: [:edit, :update]
  resources :leagues, only: [:show, :index] do
    resources :articles, only: [:show, :index]
    resources :videos, only: [:show, :index]
    resources :news, only: [:index]
  end
  resources :tags, only: [:show, :index] do
    get 'videos' => 'tags#video_tag', on: :member
  end

  put 'my_team' => 'main#change_my_team', as: :change_my_team
  post 'feedback' => 'feedback#create', as: :feedbacks
  

end
