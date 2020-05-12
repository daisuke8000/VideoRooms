Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  #root to: 'homes#index'
  root 'homes#index'
  resources :users
  resources :rooms do
    resources :videos
  end
end
