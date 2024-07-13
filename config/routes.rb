Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :categories
    resources :post_comments
  end
  scope module: :public do
    devise_for :users
    resources :spots do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
    end
    root to: 'homes#top'
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    get '/home/about' => 'homes#about', as: "about"
    get 'tagsearches/search', to: 'tagsearches#search'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
