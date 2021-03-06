Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/users/search' => 'users#search'
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get '/books/search' => 'books#search'
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'message/:id' => 'messages#show', as: 'message'
  resources :messages, only: [:create, :index]
  delete 'notification/destroy_all' => 'notifications#destroy_all', as: 'notification'
  resources :notifications, only: :index
end

#書く順番気をつける