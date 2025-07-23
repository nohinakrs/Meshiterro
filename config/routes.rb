Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  #get 'post_images/new' get 'post_images/index' get 'post_images/show'の短縮表記、resourcesの一括生成機能の範囲を限定して実現している
  #:createを追加（10章）
  #:destroyリンクを追加(13章)
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  #usersのルーティング(14章)
  resources :users, only: [:show, :edit]

  get "/homes/about" => "homes#about", as: "about"
end
