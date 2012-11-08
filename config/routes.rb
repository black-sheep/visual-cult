VisualCultV2::Application.routes.draw do

  get '/admin' => 'pages#admin'

  match '/vote/:id' => 'jscripts#vote'
  match '/take_role/:user_id/:role_id' => 'jscripts#take_role'

  match '/admin/permissions/roles', :as => :users_roles

  namespace :admin do
    resources :technologies, :colors, :rubriks, :interiors, :permissions, :decors
  end

  devise_for :users

  resources :users do
    resources :galleries do
      resources :photos
    end
  end

  resources :users do
    resources :blogs
  end

  resources :news

  root :to => 'pages#index'

end
