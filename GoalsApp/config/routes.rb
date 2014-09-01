Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :users

end
