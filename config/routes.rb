Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'books' => 'books#index'
      get 'books/:id' => 'books#show'
      post 'books' => 'books#create'
      delete 'books/:id' => 'books#destroy'
      patch 'books/:id' => 'books#update'
    end
  end
end
