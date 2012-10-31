Carbometer::Application.routes.draw do

  resource :dashboard
  resources :parts, only: [:index, :show]
  resources :posts, only: [:index]
  root to: 'content#home'

end
