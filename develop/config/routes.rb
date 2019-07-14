Rails.application.routes.draw do
  get 'top' => 'top#top'
  namespace :admins do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
  end
  namespace :users do
    get 'orders/new'
    get 'orders/create'
  end
  namespace :users do
    get 'items/index'
    get 'items/show'
  end
  namespace :users do
    get 'carts/index'
    get 'carts/create'
    get 'carts/update'
    get 'carts/destroy'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
