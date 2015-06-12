Rails.application.routes.draw do

  root 'pages#index', as: :root

  get 'contact' => 'pages#contact', as: :contact

  resources :albums, only: [:index, :show, :update] do
    resources :songs, only: [:index, :show, :update]
  end

end
