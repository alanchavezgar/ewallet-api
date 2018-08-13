Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'autenticacion#autenticar'

  namespace :sistema do
    post 'signup', to: 'usuarios#create'
    get 'mi_cuenta', to: 'usuarios#show'
  end

  namespace :finanzas, only: [:index, :create] do
    resources :depositos
    resources :retiros
    resources :transferencias
  end
end
