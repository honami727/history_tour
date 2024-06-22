Rails.application.routes.draw do
  get 'spots/new'
  get 'spots' => 'spots#index'
  get 'spots/:id' => 'spots#show', as: 'spot'
  get 'spots/edit'
  post 'spots' => 'spots#create'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
