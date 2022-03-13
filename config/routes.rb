Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home' #home page view at root
  get 'about', to: 'pages#about' #about page view
  resources :articles, only: [:show, :index]
end
