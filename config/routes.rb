Rails.application.routes.draw do
  # resources :buyer_stocks, only: [:create]
  resources :buyer_stocks
  resources :broker_stocks, only: [:create, :destroy, :show]
  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :brokers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  devise_for :buyers, :controllers => { :registrations => :registrations, :sessions => :sessions }
  root 'home#index'
  get 'search_stock' => 'stocks#stock_search'
  get '/admin/index' => 'admin#index'

  # Broker
  get '/broker/index' => 'broker#index'
  get '/broker/portfolio' => 'broker#portfolio'
  get '/broker/transactions' => 'broker#transactions'

  # Buyer
  get '/buyer/index' => 'buyer#index'
  get '/buyer/portfolio' => 'buyer#portfolio'
  get '/buyer/transactions' => 'buyer#transactions'
  
  # Redirect fix for invalid sign up and sign in
  # devise_scope :buyer do
  # get '/buyers', to: 'devise/registrations#new'
  # get '/buyers/password', to: 'devise/passwords#new'
  # end

  # devise_scope :broker do
  # get '/brokers', to: 'devise/registrations#new'
  # get '/brokers/password', to: 'devise/passwords#new'
  # end

  # devise_scope :admin do
  # get '/admins', to: 'devise/registrations#new'
  # get '/admins/password', to: 'devise/passwords#new'
  # end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
