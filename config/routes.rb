Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root "departments#index"
  
  get 'static_pages/home'
  get 'static_pages/about'
  root "static_pages#home"
	get "/about", to: "static_pages#about"

  resources :departments
end
