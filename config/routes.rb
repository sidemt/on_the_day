Rails.application.routes.draw do
  root 'static_pages#home', via: [:get, :post]
end
