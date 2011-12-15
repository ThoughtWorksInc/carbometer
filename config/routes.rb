Carbometer::Application.routes.draw do
  resources :authentications, :only => [:index, :destroy]
  match '/auth/:provider/callback', :to => 'sessions#create'
  
  root :to => 'dashboards#index'
end
