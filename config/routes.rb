Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  resources :users, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :posts, only:[:new,:create,:edit,:update,:destroy] do
    collection do
      get 'search'
    end

    resources :likes, only: [:create, :destroy]
  end

end
