Rails.application.routes.draw do

  root 'static_pages#landing_page'

  #root 'products#index'

  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  post 'static_pages/thank_you', to: 'static_pages#thank_you'

  get 'static_pages/about', to: 'static_pages#about'

  get 'static_pages/contact', to: 'static_pages#contact'

  get 'static_pages/landing_page', to: 'static_pages#landing_page'



end
