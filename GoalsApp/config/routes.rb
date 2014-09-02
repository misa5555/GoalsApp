Rails.application.routes.draw do
  get 'goals/new'

  get 'goals/index'

  get 'goals/show'

  get 'goals/edit'

  get 'goals/create'

  get 'goals/update'

  get 'goals/destroy'

  resource :session, only: [:create, :new, :destroy]
  resources :users
  resources :goals
end
