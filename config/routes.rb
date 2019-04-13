Rails.application.routes.draw do
  get 'home/index'
  get 'static_pages/home'
  root to: 'home#index'
  resources :dis_liked_posts
  resources :liked_posts
  resources :reports
  resources :comments
  resources :posts
  resources :geofences
  resources :user_types
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
