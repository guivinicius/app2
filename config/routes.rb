App2::Application.routes.draw do
  devise_for :users

  resources :emails

  root :to => 'emails#index'
end
