Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]

      resources :users do
        resources :rents, only: [:index, :create]
      end

      resources :book_suggestions, only: [:create]

      get 'book_information/:isbn', action: :book_information, controller: 'book_information'
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
