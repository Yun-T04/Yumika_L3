Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :tweets
  root 'tweets#index'
  #get 'tweets/new', to: 'tweets#new', as: 'new_tweet' 
  #post 'tweets', to: 'tweets#create'
  #get 'tweets/:id', to: 'tweets#show', as: 'tweet'
  #get 'tweets/:id/edit', to: 'tweets#edit', as: 'edit_tweet'
  #patch 'tweets/:id', to: 'tweets#update'
  #delete 'tweets/:id', to: 'tweets#destroy'

end
