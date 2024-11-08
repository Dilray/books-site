Rails.application.routes.draw do
  resources :books
  root 'books#index'  # Устанавливаем корневой маршрут на индекс книг
  post '/add_book/' => 'books#new'
  get '/edit_book/' => 'books#edit'
  post '/delete_book/' => 'books#destroy'
end