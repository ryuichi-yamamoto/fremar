Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root 'items#index'

  resources :items, except: :index do
    collection do
      get 'purchase/:id' => 'items#purchase', as: 'purchase'
      post 'pay/:id'=> 'items#pay', as: 'pay'
      get  'done'=> 'items#done', as: 'done'
      get  'search'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do 
      get 'done'
    end
  end
  resources :cards, only: [:new, :create, :show] do
    collection do
      post 'delete', to: 'cards#delete'
    end
    member do
      get 'confirmation'
    end
  end
  get 'signup', to: 'users#new'
  resources :addresses, only: [:new, :create, :edit, :update]
end
