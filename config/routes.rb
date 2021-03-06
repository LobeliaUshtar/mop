Rails.application.routes.draw do
  root 'mop_info_pages#mission'

  get 'mission', to: 'mop_info_pages#mission'
  get 'volunteer', to: 'mop_info_pages#volunteer'
  get 'hours', to: 'mop_info_pages#hours'

  resources :inventories
    get 'inventories/filter/:filter' => 'inventories#index', as: :filtered_inventories

  resources :categories

  resources :donators
    get 'donators/filter/:filter' => 'donators#index', as: :filtered_donators

  resources :links

  resources :events
    get 'events/filter/:filter' => 'events#index', as: :filtered_events

  resources :users
    get 'signup' => 'users#new'
    get 'users/filter/:filter' => 'users#index', as: :filtered_users

  resource :session
    get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'
end