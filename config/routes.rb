Rails.application.routes.draw do
  get '/api/v1/books', to: 'books#index'
  get '/api/v1/books/:id', to: 'books#show'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
