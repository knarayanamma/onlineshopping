Rails.application.routes.draw do
  resources:customers do
  collection do
  	get "signin"
  	post "signup"
  	get "logout"
  	get "forget_password"
  	post "recoverypassword"
  end
end
root to:"customers#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
