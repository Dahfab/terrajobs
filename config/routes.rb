Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: "application#index"

    get "/job-inserieren", to: "jobs#new"
    post "/job-inserieren", to: "jobs#create"
    resources :jobs, except: [:new, :create]
end
