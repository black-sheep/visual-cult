VisualCultV2::Application.routes.draw do

  get "permissions/index"

  namespace :admin do
    resources :technologies, :colors, :rubriks, :interiors, :permissions
  end

  devise_for :users

  resources :users do
    resources :galleries do
      resources :photos
    end
  end

  resources :news

  root :to => 'pages#index'

end
