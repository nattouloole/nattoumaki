Rails.application.routes.draw do
  resources :items, only: [:index,:show]
  
  namespace :admin do
  resources :items
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
end
