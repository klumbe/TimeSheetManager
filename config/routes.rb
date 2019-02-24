Rails.application.routes.draw do

  get 'logs/', to: 'logs#index'
  get 'logs/:id', to: 'logs#show'

  devise_for :users
  root to: 'time_entries#index'

  resources :time_entries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
