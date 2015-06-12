Rails.application.routes.draw do

  root 'pages#index', as: :root

  resources :albums, only: [:index, :update, :show]

end
