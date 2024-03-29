Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about'=>'homes#about'
  
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings'=>'relationships#followings', as: 'followings'
    get 'followers'=>'relationships#followers', as: 'follower'
    get :favorites, on: :collection 
  end
  
  resources :groups do
    get "join" => "groups#join"
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end 
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  get 'search'=>'searches#search'
end
