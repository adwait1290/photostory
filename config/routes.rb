Rails.application.routes.draw do
  post 'session' => 'sessions#create'
  	get 'photos/new'
	get 'users/register'
	get 'users/login'
  	get 'photos/show'
  	get 'session' => "sessions#new"
  	get 'photos/edit'
  	post "photos/" => "photos#create"
  	get 'photos/destroy'
	get 'sessions/destroy'
	root "sessions#new"

	post 'session' => "sessions#create"
	post "users/new" => "users#create_user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
