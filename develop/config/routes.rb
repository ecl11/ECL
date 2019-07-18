Rails.application.routes.draw do
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
