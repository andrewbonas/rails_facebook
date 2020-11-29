Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks" }
  resources :posts do 
    resources :comments
    member do 
      get '/like', to: 'posts#like', as: :like
      get '/unlike', to: 'posts#unlike', as: :unlike
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  get '/users', to: 'users#index', as: :users
  get '/:id', to: 'users#show', as: :user
  get '/:id/request', to: 'users#request_friendship', as: :request
  get '/:id/accept', to: 'users#accept_friendship', as: :accept
  get '/:id/decline', to: 'users#decline_friendship', as: :decline
  get '/:id/unfriend', to: 'users#remove_friendship', as: :unfriend

end
