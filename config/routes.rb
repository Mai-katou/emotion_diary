Rails.application.routes.draw do

devise_for :admin, skip:[:registrations], controllers: {
      sessions: "admin/sessions"
  }

devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about"

    resources :users, only: [:show, :edit, :update]
    resources :diaries, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

    namespace :admin do
        get 'homes/top'
        resources :emotions, only: [:index, :new, :create, :edit, :update, :destroy]
      end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
