Carbometer::Application.routes.draw do
  resource :dashboard
  root to: 'content#home'
end
