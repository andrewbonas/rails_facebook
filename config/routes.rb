Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do 
    resources :comments
    member do 
      get '/like', to: 'posts#like', as: :like
      get '/unlike', to: 'posts#unlike', as: :unlike
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "posts#index"

end
