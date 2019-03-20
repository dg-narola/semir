Rails.application.routes.draw do
  resources :seminartopics
  devise_for :users
  root to: 'seminartopics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
