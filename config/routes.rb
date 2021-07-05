Rails.application.routes.draw do
  get 'users/new'
  get 'users/:id' => 'users#show'
  post 'users/create'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id/edit' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  get 'secrets' => 'secrets#index'
  post 'secrets/new'
  delete 'secrets/:id' => 'secrets#destroy'
  post 'likes/:id' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
