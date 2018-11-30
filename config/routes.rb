Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root to: "application#index"

    get "backend", to: "sessions#new"
    delete "logout", to: "sessions#destroy"
    get "job-inserieren", to: "jobs#new"
    resources :sessions, only: [:create]
    resources :jobs, except: [:new]
    resources :categories, path: "", only: :show, id: :slug
end
