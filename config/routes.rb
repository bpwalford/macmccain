Rails.application.routes.draw do

  root 'pages#index', as: :root

  get 'contact' => 'pages#contact', as: :contact

  resources :albums, only: [:index, :show, :update] do
    resources :songs, only: [:index, :show, :update]
  end

  resources :users, except: [:index, :show]

  post 'sign-in'  => 'sessions#create',  as: :login
  get  'sign-out' => 'sessions#destroy', as: :logout

end
