Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: "application#index"

    get "backend", to: "sessions#new"
    get "logout", to: "sessions#destroy"
    get "job-inserieren", to: "jobs#new"
    resources :sessions, only: [:create]
    resources :jobs, except: [:new]
    resources :categories, path: "", only: :show, id: :slug
end
