Hood::Application.routes.draw do

  root :to => 'welcome#temp_slider'
  resources :users
  resources :sessions, :only => [:create]
  resources :neighborhoods, :only => :show
  resources :listings, :only =>  :show
  resources :choices, :only => [:create] do
    member do
      post 'vote'
    end
  end

  match '/sessions/destroy' => 'sessions#destroy', :as => 'logout'
end
