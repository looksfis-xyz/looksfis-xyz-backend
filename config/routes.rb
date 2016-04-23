Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :sessions,   only: [:create]
      resources :posts,    only: [:index]
      resources :users,    only: [:create]    do
        resources :posts,  only: [:create]
        patch 'posts/:id'                 => 'posts#update'
      end
    end
  end
end
