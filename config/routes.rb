Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :sessions,   only: [:create]
      resources :post,    only: [:index]
      resources :user    do
        resources :post,   only: [:create]
        patch 'posts/:id'                 => 'posts#update'
      end
    end
  end
end
