Rails.application.routes.draw do

  namespace :end_users do
    get 'shops/index'
    get 'shops/show'
  end
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
  get      'top/index'
  get      'top/show'
  root to: 'top#index'

namespace    :end_users do
  resources  :products do
    get 'show', on: :member
  end
  resources  :shops
  resources  :end_users
  resource   :product_comments,only: [:create, :destroy]
  resource   :favorites,only: [:create, :destroy]

end

namespace :producers do
 resources :producers do
 	get 'shops',    on: :member
  get 'products', on: :member
  get 'search',   on: :collection
  get 'withdraw', on: :member
 end
 	get 'shops',    to: 'producers#shops'
  get 'products', to: 'producers#products'
  get 'search',   to: 'producers#search'
  get 'withdraw', to: 'producers#withdraw'
 resources :shops
 resources :products
end

resource :admins do
	get 'index', on: :collection
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
