Rails.application.routes.draw do
  get 'conversation/index'

  get 'conversation/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'conversation#index'
  mount ActionCable.server => '/cable'
end
