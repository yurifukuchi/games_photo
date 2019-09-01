Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  resources :users, :only => [:show] do
    member do
      get 'likes'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :posts, except: [:index] do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end

end
