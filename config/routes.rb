Rails.application.routes.draw do

  devise_for :users , controllers: { confirmations: "users/confirmations", passwords: "users/passwords", registrations: "users/registrations", sessions: "users/sessions", unlocks: "users/unlocks" }

  root 'articles#index'

  resources :articles do
    
    resources :comments
    
    namespace :vote do
      patch 'up', controller: '/articles_votes', action: 'up'
      patch 'down', controller: '/articles_votes', action: 'down'
      patch 'undo', controller: '/articles_votes', action: 'undo'
    end

  end

end
