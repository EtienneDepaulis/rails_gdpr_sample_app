Rails.application.routes.draw do
  devise_for :users

  mount PolicyManager::Engine => "/policies"

  root to: "home#index"
end
