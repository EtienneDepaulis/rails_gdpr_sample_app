Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :articles
  devise_for :users

  mount PolicyManager::Engine => "/policies", as: "policy_manager"

  root to: "articles#index"
end
