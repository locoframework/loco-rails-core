Rails.application.routes.draw do
  namespace :panel do
    namespace :admin do
      resources :users, only: [:index]
    end
  end

  root to: 'main/pages#index'
end
