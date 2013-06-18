Hood::Application.routes.draw do

  root :to => 'welcome#index'
  resources :users
  resources :neighbor, :controller => 'users'
  resources :realtor, :controller => 'users'
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
  match '/listings/:id/post/new' => 'comments#new', :as => 'new_comment'
  match '/listings/:id/post/create' => 'comments#create', :as => 'comments'
  match 'users/:id/add_photo' => 'users#add_photo', :as => 'add_user_photo'
end
