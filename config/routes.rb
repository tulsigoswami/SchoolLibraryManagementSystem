Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"

  resources :faculties,only:[:update], shallow: true do
    resources :books, only:[:index,:update,:destroy]
    resources :categories, only:[:index,:delete,:create]
    resources :book_issue_requests, only:[:update,:destroy]
  end

  resources :students, only: [:show,:update,:create] do
    resources :books, only:[:show]
  end

  get 'images/:imageable_id/:imageable_type', to: 'images#show'

  post 'students/:student_id/request_book/:book_id', to: 'book_issue_requests#create'

  get 'faculty/:faculty_id/show_all_book_issue_requests', to:'book_issue_requests#index'

  post 'images/create', to: 'images#create'
end
