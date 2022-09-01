Rails.application.routes.draw do
  resources :managements do
    resource :favorites, only: [:create, :destroy]
  end
  resources :diet_managements
  resources :categories
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
