Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :sessions,   only: [:create]
      resources :posts,    only: [:index]
      resources :users,    only: [:create]    do
        resources :lost_posts,  only: [:create]
        resources :found_posts,  only: [:create]

        patch 'posts/:id'                 => 'posts#update'
      end
      post "login" => 'users#login'
    end
  end
end
