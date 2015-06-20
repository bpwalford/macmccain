Rails.application.routes.draw do

  root 'pages#index', as: :root

  get  'contact' => 'pages#contact', as: :contact
  post 'notify'  => 'pages#notify',  as: :notify

  resources :albums, only: [:index] do
    resources :songs, only: [:index]
  end

  get 'song'  => 'songs#download_song',  as: :download_song
  get 'album' => 'songs#download_album', as: :download_album

  namespace :admin do
    get '/' => 'admin#index'
    get 'purchases' => 'admin#purchases'
    get 'songs' => 'admin#songs'
    get 'users' => 'admin#users'
  end

# -----------------------------------------------
  resources :users, except: [:index, :show]

  post 'sign-in'  => 'sessions#create',  as: :login
  get  'sign-out' => 'sessions#destroy', as: :logout
end
