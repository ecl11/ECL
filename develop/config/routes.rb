Rails.application.routes.draw do
  namespace :admins do
    get 'artists/new'
    get 'artists/create'
    get 'artists/index'
    get 'artists/edit'
    get 'artists/update'
  end
  namespace :admins do
    get 'genres/new'
    get 'genres/create'
    get 'genres/index'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'labels/new'
    get 'labels/create'
    get 'labels/index'
    get 'labels/edit'
    get 'labels/update'
  end
  namespace :users do
    get 'addresses/new'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/index'
    get 'addresses/update'
  end
  namespace :admins do
    get 'addresses/new'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/index'
    get 'addresses/update'
  end
  get 'top' => 'top#top'

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/registrations'
  }

  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }

  namespace :admins do
    resources :orders, :users, :items
    end

  namespace :users do
    resources :carts, :items, :orders, :users
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
