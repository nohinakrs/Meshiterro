Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  #get 'post_images/new' get 'post_images/index' get 'post_images/show'の短縮表記、resourcesの一括生成機能の範囲を限定して実現している
  #:createを追加（10章）
  resources :post_images, only: [:new, :create, :index, :show]

  get "/homes/about" => "homes#about", as: "about"
end
