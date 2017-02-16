Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations =>"user_registrations"}

  resources :users

  root 'static_pages#landing_page'

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  post 'static_pages/thank_you', to: 'static_pages#thank_you'

  get 'static_pages/about', to: 'static_pages#about'

  get 'static_pages/contact', to: 'static_pages#contact'

  get 'static_pages/landing_page', to: 'static_pages#landing_page'



end
