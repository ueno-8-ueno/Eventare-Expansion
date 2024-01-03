Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # 会員認証ルーティング
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者認証ルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # root_path
  root to: 'public/homes#top'
  

  # 会員ルーティング
  scope module: :public do
    get '/about' => 'homes#about', as: 'about'
  end

  # 管理者ルーティング
  namespace :admin do
  end
end
