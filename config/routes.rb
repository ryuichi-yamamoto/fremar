Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items do
    collection do
      get 'purchase/:id' => 'items#purchase', as: 'purchase'
      post 'pay/:id'=> 'items#pay', as: 'pay'
      get  'done'=> 'items#done', as: 'done'
    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :cards, only: [:new, :show] do
    collection do
      get 'confirmation'
    end
  end
end
