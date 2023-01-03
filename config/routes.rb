Rails.application.routes.draw do
  get 'admins/controller'
  # get 'books/create'
  # get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  post 'users/signup', to: 'users#create'
  post 'users/login', to: 'users#login'
  post 'admins/signup', to: 'admins#create'
  post 'admins/login', to: 'admins#login'
  get 'plans', to: 'issue_boos#purches_plan'

  resources :books
  resources :plans
  resources :admins 

end
