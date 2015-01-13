Rails.application.routes.draw do
  
  devise_for :users , controllers: { confirmations: "users/confirmations", passwords: "users/passwords", registrations: "users/registrations", sessions: "users/sessions", unlocks: "users/unlocks" }

  root 'articles#index'

  resources :articles do
    resources :comments
  end

end
