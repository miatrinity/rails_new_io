Rails.application.routes.draw do
  get 'initial_setup/index'
  root to: 'initial_setup#index'
  get '/:id', to: 'pages#show', as: 'page'

  resources :manual_app_verifications, only: :show

  namespace :admin do
    resources :automated_app_verifications, only: :index
  end
end
