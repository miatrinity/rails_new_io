Rails.application.routes.draw do
  get "initial_setup/index"
  root to: "initial_setup#index"

  resources :manual_app_verifications, only: :show

  namespace :admin do
    resources :app_recipes, only: :index do
      resources :verification_runs, only: %w[create show]
    end
  end

  get "/:id", to: "pages#show", as: "page"
end
