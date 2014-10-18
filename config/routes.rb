Rails.application.routes.draw do
  root "inventories#index"

  resources :inventories
    get 'inventories/filter/:filter' => 'inventories#index', as: :filtered_inventories
    # get 'inventories/:filter' => "inventories#index", constraints: { filter: /low|all/ }, as: :filtered_inventories

  resources :categories

  resources :donators
    get 'donators/filter/:filter' => 'donators#index', as: :filtered_donators
    # get 'donators/:filter' => "donators#index", constraints: { filter: /former|all/ }, as: :filtered_donators

  resources :events

  resources :users
    get 'signup' => 'users#new'

  resource :session
    get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'
end