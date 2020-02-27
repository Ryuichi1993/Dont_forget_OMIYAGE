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
  get      'top/index'
  get      'top/show'
  root to: 'top#index'

namespace    :end_users do
  resources  :memories
  resources  :reservations do
    get 'thank', on: :collection
  end
  get 'thank', to: 'reservation#thank'
  resources  :product_categories, only: [:index, :show]
  resources  :categories, only: [:index, :show] do
    get'search_product', on: :collection
  end
  get 'search_product', to:'categories#search_product'
  resources  :products do
  get 'search',   on: :collection
  resource  :product_comment,only: [:create, :destroy]
  resource  :favorite, only: [:create, :destroy]
  end
  get 'search',   to: 'end_users#search'
  resources  :shops do
  get'search_shop', on: :collection
  end
  get 'search_shop',   to: 'shops#search_shop'
  resources  :end_users do
  get 'withdraw', on: :member
  get 'ranking',  on: :collection
  get 'iine_ranking', on: :collection
  end
  get 'withdraw', to: 'end_users#withdraw'
  get 'ranking',  to: 'end_users#ranking'
  get 'iine_ranking', to: 'end_users#iine_ranking'
end


namespace :producers do
 resources :producers do
  get 'shops',    on: :member
  get 'search',   on: :collection
  get 'withdraw', on: :member
 end
  get 'producers/shops',    to: 'producers#shops'
  get 'search',   to: 'producers#search'
  get 'withdraw', to: 'producers#withdraw'
 resources :shops
 resources :products do
  get 'ichiran',  on: :member
  get 'search',   on: :collection
  end
  get 'ichran',   to: 'producers#ichiran'
  get 'search',   to: 'products#search'

end

namespace :admins do
  resources :admins
  resources :tops
  resources :end_users
  resources :producers
  resources :shops
  resources :products
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
