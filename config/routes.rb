Rails.application.routes.draw do

	# ----- add these lines here: -----
    
	# Add a root route if you don't have one...
	# We can use users#new for now, or replace this with the controller and action you want to be the site root:
	#root to: 'users#new'
	root to: 'home#index'
    get 'users/admin'	
    get 'users/welcome'
	get 'orders/index'
	get 'orders/adminhistory'
	post 'orders/adminhistory'
	get 'orders/report'
 
  	# sign up page with form:
	get 'users/new' => 'users#new', as: :new_user
#	get 'sessions/new' => 'sessions#new', as: :new_session
	
	# create (post) action for when sign up form is submitted:
	post 'users' => 'users#create'

    get '/login'     => 'sessions#new', as: :new_session
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# delete action to log out:
	get '/logout' => 'sessions#destroy', as: :destroy_session

  	# ----- end of added lines -----

	  get 'orders/new' => 'orders#new', as: :new_order

	  post 'orders' => 'orders#create'

    put 'orders' => 'orders#update'
	
end
