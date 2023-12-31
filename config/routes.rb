Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
  root to: "homes#top"
  get "homes/about"=>"homes#about", as: "about"

  resources :items, only: [:index,:show]
  
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  resources :cart_items, only: [:index, :update, :destroy, :create]
  

  
  post "/orders/comfirm" => "orders#comfirm"
  get "/orders/complete" => "orders#complete"
  resources :orders, only: [:new, :create, :index, :show]
  
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  get "/customers/check" => "customers#check"
  patch "/customers/withdraw" => "customers#withdraw"
  get "customers/mypage" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  end

  namespace :admin do

  get "/" => "homes#top"

  resources :items

  resources :genres, only: [:index, :create, :edit, :update]

  resources :customers, only: [:index, :show, :edit,:update]

  resources :orders, only: [:show, :index, :update]

  resources :orders_details, only: [:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
end
