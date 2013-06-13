Hood::Application.routes.draw do

  root :to => 'welcome#index'
  resources :users
  resources :sessions, :only => [:create, :destroy]
  resources :neighborhoods, :only => :show
end
