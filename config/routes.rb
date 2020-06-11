Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

resources :articles do
  resources :comments
end

resource :contacts, only: [:new, :create], path_names: { :new => '' }
end
