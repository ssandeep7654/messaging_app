Rails.application.routes.draw do
  resources :chatrooms
  devise_for :users

  root "dashboard#index"

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

end
