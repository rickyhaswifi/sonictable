Rails.application.routes.draw do
  get 'songs/index'
  get 'songs/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'charts#index'

  resources :blogs
  

  resources :charts 
  resources :artists do
    resources :songs
  end

end
