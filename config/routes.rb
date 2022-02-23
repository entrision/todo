Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    member do
      get :finish
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'items#index'
end
