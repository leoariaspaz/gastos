Rails.application.routes.draw do
  resources :movimientos
  resources :transacciones
  resources :tipos_transacciones
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
