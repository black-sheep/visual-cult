VisualCultV2::Application.routes.draw do

  get "photos/index"

  get "photos/new"

  get "photos/show"

  get "photos/edit"

  devise_for :users

  resources :users do
    resources :galleries do
      resources :photos
    end
  end

  resources :news

  root :to => 'pages#index'

end
