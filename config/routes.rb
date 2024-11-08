Rails.application.routes.draw do
  resources :books
  root 'books#index'  # Устанавливаем корневой маршрут на индекс книг
end