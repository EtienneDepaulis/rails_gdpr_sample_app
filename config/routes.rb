Rails.application.routes.draw do
  resources :articles
  devise_for :users

  mount PolicyManager::Engine => "/policies", as: "policy_manager"

  root to: "articles#index"
end
