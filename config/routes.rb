Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'autenticar', to: 'autenticacion#autenticar'

  namespace :sistema do
    post 'signup', to: 'usuarios#create'
  end

  namespace :finanzas do
    resources :depositos, :retiros, :transferencias, only: [:index, :show, :create]
  end
end
