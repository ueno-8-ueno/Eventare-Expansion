Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # 会員認証ルーティング
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # root_path
  root to: 'public/homes#top'

  # 会員ルーティング
  scope module: :public do
    get '/about' => 'homes#about', as: 'about'

    resources :members, only: [:show, :edit, :index, :update]
    get 'members/:id/unregistration' => 'members#unregistration', as: 'member_unregistration'
    patch 'members/:id/withdrawal' => 'members#withdrawal', as: 'member_withdrawal'

    resources :events, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    patch 'events/:id/status' => 'events#status', as: 'event_status'
  end


  # 管理者認証ルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # 管理者ルーティング
  namespace :admin do
    get '/' => 'homes#top'
    resources :members, only: [:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :events, only: [:index, :show]
  end
end
