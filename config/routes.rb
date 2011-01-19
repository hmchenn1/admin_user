SampleApp::Application.routes.draw do
  #get "sessions/new"

  resources :users
  #get "users/new"
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signup', :to =>'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'    #then redirect to root_path
  match '/admin', :to => 'sessions#new'
   
  root :to => 'sessions#new'
  #root_path => '/'
  #root_url  => 'http://localhost:3000/'
  

end
