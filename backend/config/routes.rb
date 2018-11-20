Rails.application.routes.draw do
  root 'welcome#index'
  resources :companies do
    collection do
      get 'parish'
    end
  end
  resources :users, only: :create
  resources :users, only: :create do
    collection do
      post 'confirm'
      post 'login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end