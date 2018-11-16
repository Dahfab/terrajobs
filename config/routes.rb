Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: "application#index"

    get "/job-inserieren", to: "jobs#new"
    resources :jobs, except: [:new]
    resources :companies
    resources :categories, path: ""
end
