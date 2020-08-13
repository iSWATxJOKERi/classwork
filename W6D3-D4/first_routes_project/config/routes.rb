Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show, :create, :update, :destroy] do
      resources :artworks, only:[:index]
      resources :comments, only:[:index, :create, :destroy]
  end
  resources :artwork_shares, only:[:create, :destroy]
  resources :artworks, only:[:show, :create, :update, :destroy] do
    resources :comments, only:[:index, :create, :destroy]
  end

  # get '/users', to: 'users#index', as: 'user'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
end
