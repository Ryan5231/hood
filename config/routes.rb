Hood::Application.routes.draw do

  root :to => 'welcome#index'
  resources :users
  resources :sessions, :only => [:create]
  resources :neighborhoods, :only => :show
  resources :listings
  resources :choices, :only => [:create] do
    member do
      post 'vote'
    end
  end

  match '/sessions/destroy' => 'sessions#destroy', :as => 'logout'
  match '/listings/:id/close' => 'listings#close', :as => 'close_listing'
  match '/listings/:id/reopoen' => 'listings#reopen', :as => 'reopen_listing'
  match '/listings/:id/post/new' => 'posts#new', :as => 'new_post'
  match '/listings/:id/post/create' => 'posts#create', :as => 'posts'
end
