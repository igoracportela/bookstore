Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'books' => 'books#index'
    get 'books/:id' => 'books#show'
    post 'books' => 'books#create'
    delete 'books/:id' => 'books#destroy'
    #resource :books, format: :json
  end
end
