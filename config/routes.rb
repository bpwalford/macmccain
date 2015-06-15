Rails.application.routes.draw do

  root 'pages#index', as: :root

  get  'contact' => 'pages#contact', as: :contact
  post 'notify'  => 'pages#notify',  as: :notify

  resources :albums, only: [:index, :show, :update] do
    resources :songs, only: [:index, :show, :update]
  end

  resources :users, except: [:index, :show]

  post 'sign-in'  => 'sessions#create',  as: :login
  get  'sign-out' => 'sessions#destroy', as: :logout

  namespace :admin do
    get '/' => 'admin#index'
    get 'purchases' => 'admin#purchases'
    get 'songs' => 'admin#songs'
    get 'users' => 'admin#users'
  end

end
