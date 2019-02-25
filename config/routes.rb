Rails.application.routes.draw do 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root to: "application#index"

    get "backend", to: "sessions#new"
    delete "logout", to: "sessions#destroy"
    get "job-inserieren", to: "jobs#new"
    get "impressum", to: "application#impressum"
    get "datenschutz", to: "application#datenschutz"
    get "geojobs", to: "application#geojobs"
    resources :sessions, only: [:create]
    resources :jobs, except: [:new], id: :slug
    resources :categories, path: "", only: :show, id: :slug
end
