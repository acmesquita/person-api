Rails.application.routes.draw do
  resources :people, only: [ :create ]

  get "up" => "rails/health#show", as: :rails_health_check
end
