Rails.application.routes.draw do

  root 'pages#index', as: :root

  get  'contact' => 'pages#contact', as: :contact
  post 'notify'  => 'pages#notify',  as: :notify

  get  'donate'   => 'pages#donate',  as: :donate
  post 'process'  => 'pages#process_donation',  as: :process
  get  'finalize' => 'pages#thank_you', as: :thank_you

  resources :albums, only: [:index] do
    resources :songs, only: [:index]
  end

  get 'song'  => 'songs#download_song',  as: :download_song
  get 'album' => 'songs#download_album', as: :download_album

  namespace :admin do
    get '/' => 'admin#index', as: :home
  end

  get  'login'    => 'sessions#login',   as: :sign_in
  post 'sign-in'  => 'sessions#create',  as: :login
  get  'sign-out' => 'sessions#destroy', as: :logout
end
