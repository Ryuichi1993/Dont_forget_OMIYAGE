Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :end_users, controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
}
devise_for :producers, controllers: {
  sessions:      'producers/sessions',
  passwords:     'producers/passwords',
  registrations: 'producers/registrations'
}
	  get 'top/index'
	  get 'top/show'
	  root to: "top#index"

resource :end_users do
	get 'index', on: :collection
end

namespace :producers do
 resources :producers
 resources :shops
 resources :products
end

resource :admins do
	get 'index', on: :collection
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end