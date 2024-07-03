Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  scope module: :public do
    devise_for :users
    resources :spots do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    root to: 'homes#top'
    get '/home/about' => 'homes#about', as: "about"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
