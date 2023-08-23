Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"

   resources :users, only:[:create,:update,:destroy] do
      resources :books, only:[:index]
   end

  resources :faculties,shallow: true,only:[:index] do
    resources :books, only:[:create,:update,:destroy]
    resources :categories, only:[:index,:create]
    resources :book_issue_requests, only:[:update]
  end

  post 'auth/login', to: 'authentication#login'

  post 'students/:student_id/request_book/:book_id', to: 'book_issue_requests#create'

  get 'faculty/:faculty_id/show_all_book_issue_requests', to:'book_issue_requests#index'

  get 'images/:imageable_id/:imageable_type', to: 'images#show'
  get 'book_request_info/:student_id', to: 'book_issue_requests#show'

  post 'images/create', to: 'images#create'
  post 'images/create_book_profile', to: 'images#create_book_profile'
end
