Rails.application.routes.draw do
  
  root 'welcome#index'
  get 'welcome/index'

  resources :users
  resources :sessions
    # get 'users#new'
end
