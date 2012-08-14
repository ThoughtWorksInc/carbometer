Carbometer::Application.routes.draw do

  resource :dashboard
  resources :parts, only: [:index, :show]
  root to: 'content#home'

end
