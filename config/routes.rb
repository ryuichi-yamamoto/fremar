Rails.application.routes.draw do
  root 'dep#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items do
    collection do
      get 'purchase/:id' => 'items#purchase', as: 'purchase'
    end
  end
  resources :users
end
