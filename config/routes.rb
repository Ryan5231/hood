Hood::Application.routes.draw do

  root :to => 'welcome#index'
  resources :users
  resources :sessions, :only => [:create, :destroy]
  resources :neighborhoods, :only => :show
  resources :listings, :only =>  :show
  resources :choices, :only => [:create] do
    member do
      post 'vote'
    end
  end
end
