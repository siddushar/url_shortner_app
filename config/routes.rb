require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "links#index"

  mount Rswag::Ui::Engine => '/api_docs'
  mount Rswag::Api::Engine => '/api_docs'

  namespace :api do
    namespace :v1 do

      post 'signup', to: 'users#create'
      post 'get_access_token', to: 'users#get_access_token'
      
      resources :links, only: [:create, :show]
    end
  end

  resources :links, only: [:create]
  get 'shortened/:short_url', to: 'links#shortened', as: :shortened
  get '/:shorted_url', to: 'links#show'
end
