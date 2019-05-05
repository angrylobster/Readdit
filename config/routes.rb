Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, :shelves, :reviews
  root 'books#index'

  get '/books/:book_id/user' => 'user#index', as: 'book_user'
  get '/books/:book_id/user/new' => 'user#create', as: 'new_book_customer'
  post '/books/:book_id/user' => 'user#create'

  get '/users/:user_id/books' => 'books#index', as: 'customer_books'
  get '/users/:user_id/books/new' => 'books#create', as: 'new_customer_books'
  post '/users/:user_id/books' => 'books#create'

  # Routes for adding book(s) to specified shelf
  # get '/shelves/:shelf_id/books' => 'books#index', as: 'shelf_books'
  # get '/shelves/:shelf_id/books/new' => 'books#new', as: 'new_shelf_book'
  # post '/shelves/:shelf_id/books' => 'books#create'
  resources :shelves do
    resources :books
  end

end