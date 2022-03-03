Rails.application.routes.draw do

  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'diaries/index'
    get 'diaries/new'
    get 'diaries/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
