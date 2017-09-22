# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: "movimientos#index"

  get '/informes/cuentas/saldos', controller: :cuentas, action: :saldos
  resources :cuentas
  
  get '/movimientos/carga_masiva', controller: :movimientos, action: :carga_masiva
  post '/movimientos/carga_masiva', controller: :movimientos, action: :grabar_carga_masiva
  get '/movimientos/carga_masiva/nuevo_movimiento', controller: :movimientos, action: :nuevo_movimiento_masivo
  get '/movimientos/carga_masiva/sumar', controller: :movimientos, action: :sumar
  resources :movimientos do
    get 'cuenta/:id(/pag/:page)', action: :list, on: :collection
  end

  resources :transacciones do
    member do
      get 'select_by_tipoid'
    end
    get 'tipo/:id(/pag/:page)', action: :list, on: :collection
  end
  resources :tipos_transacciones do
    get 'pag/:page', action: :index, on: :collection
  end
end
