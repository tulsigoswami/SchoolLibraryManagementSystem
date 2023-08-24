Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"

   resources :users, only:[:index,:create,:update,:destroy] do
      resources :books, only:[:index]
   end

  resources :faculties,shallow: true,only:[:index] do
    resources :books, only:[:create,:update,:destroy]
    resources :categories, only:[:index,:show,:destroy,:update]
    resources :book_issue_requests, only:[:update]
  end

  post 'auth/login', to: 'authentication#login'

  post 'request_book', to: 'book_issue_requests#create'

  get 'show_all_book_issue_requests', to:'book_issue_requests#index'

  get 'book_request_info/:student_id', to: 'book_issue_requests#show'

  resources :images, except: [:new,:update,:destroy] do
      member do
       post :create_book_profile
      end
  end
end
