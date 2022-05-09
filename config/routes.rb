Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    member do
      get :finish
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get '/samples', to: 'samples#index'
  get '/samples/icons', to: 'samples#icons'
  get '/samples/grid', to: 'samples#grid'
  get '/samples/alerts', to: 'samples#alerts'
  get '/samples/containers', to: 'samples#containers'

  # wordle tool
  post '/wordle/guess', to: 'wordle#guess'
  get '/wordle/solve', to: 'wordle#solve'
  get '/wordle', to: 'wordle#index'

  root 'items#index'
end
