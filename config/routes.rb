Rails.application.routes.draw do
  get 'users/new'
  get 'users/:id' => 'users#show'
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
