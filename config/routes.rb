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
    get "/diaries/calendar_detail/:year/:month/:day" => "diaries#calendar_detail" ,as: 'calendar_detail'
    get "/diaries/favorited_diary" => "diaries#favorited_diary" ,as: 'favorited_diary'
    patch "diaries/favorited_off/:id" => "diaries#favorited_off" ,as: 'diary_favorited_off'
    resources :diaries, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

    namespace :admin do
        get 'homes/top'
        resources :emotions, only: [:index, :new, :create, :edit, :update, :destroy]
      end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
