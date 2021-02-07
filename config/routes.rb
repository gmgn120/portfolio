Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/users/search' => 'users#search'
  resources :users, only: [:show, :edit, :update, :index]
  get '/books/search' => 'books#search'
  get '/book/review' => 'books#review'
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
