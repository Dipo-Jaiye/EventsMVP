Rails.application.routes.draw do
  root 'welcome#index'
  get '/upcoming', to: 'welcome#events'
  resources :users do
    resources :events
  end
  resources :user_sessions, only: [:create, :destroy]
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
