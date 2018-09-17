Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:update]
  root to: 'static_pages#home', via: [:get, :post]
  get 'my_page', to: 'static_pages#my_page'
end
