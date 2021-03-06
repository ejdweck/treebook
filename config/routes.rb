Rails.application.routes.draw do
  resources :paperclip_images
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :statuses
  get 'feed', to: 'statuses#index', as: :feed
  root to: 'statuses#index'

  get '/:id', to: 'profiles#show', as: :user_profile

  resources :statuses
  resources :tags, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
