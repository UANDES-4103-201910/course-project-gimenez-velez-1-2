Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  get 'login/index'
  get 'home/index'
  get 'static_pages/home'
  root to: 'posts#index'
  resources :dis_liked_posts
  resources :liked_posts
  resources :reports
  resources :geofences
  resources :user_types

  resources :users do
    resources :posts do
      resources :comments
      resources :reports
      resources :dis_liked_posts
      resources :liked_posts
    end
  end

  resources :posts do
    resources :comments
    resources :reports
    resources :dis_liked_posts
    resources :liked_posts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
