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
end
