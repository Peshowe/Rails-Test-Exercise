Rails.application.routes.draw do
  #get 'admin/index'

  #get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :conversations do
	resources :messages
  end
  resources :trainers
  resources :users
  
  get 'user' => 'conversation#index'
  get 'admin' => 'admin#index'
  controller :sessions do
	get 'login' => :new
	post 'login' => :create
	delete 'logout' => :destroy
  end
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
