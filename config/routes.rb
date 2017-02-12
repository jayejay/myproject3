Rails.application.routes.draw do

  root 'static_pages#landing_page'

  #root 'products#index'

  resources :products

  get 'static_pages/about', to: 'static_pages#about'

  get 'static_pages/contact', to: 'static_pages#contact'

  get 'static_pages/landing_page', to: 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]

end
