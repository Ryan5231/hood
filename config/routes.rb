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
  match '/sign_up' => 'users#new'
  match '/log_in' => 'sessions#create'
  match '/sessions/destroy' => 'sessions#destroy', :as => 'logout'
  match '/listings/:id/close' => 'listings#close', :as => 'close_listing'
  match '/listings/:id/reopen' => 'listings#reopen', :as => 'reopen_listing'
  match '/listings/:id/comment/new' => 'comments#new', :as => 'new_comment'
  match '/listings/:id/comment/create' => 'comments#create', :as => 'comments'
  match 'users/:id/add_photo' => 'users#add_photo', :as => 'add_user_photo'
  match '/listings/:id/comment/edit' => 'comments#edit', :as => 'edit_comment'
  match '/listings/:id/comment/update' => 'comments#update', :as => 'update_comment'
end
