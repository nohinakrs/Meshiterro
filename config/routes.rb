Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  #↑アプリケーションを発展させようの章で追記。管理者権限を実装

  root to: 'homes#top'
  devise_for :users
  
  #get 'post_images/new' get 'post_images/index' get 'post_images/show'の短縮表記、resourcesの一括生成機能の範囲を限定して実現している
  #:createを追加（10章）
  #:destroyリンクを追加(13章)
  #コメント機能のための追記(18章)
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  #usersのルーティング(14章)
  # 以下の行のonly: []内にupdateを追加(14章)
  resources :users, only: [:show, :edit, :update]

  #19章のルーティング、単数形のresourceを使うとURLにidが含まれなくなる。
  # resourceそれ自身のidが分からなくても、関連する他のモデルのidから特定できる時に用いる。
  resource :favorite, only: [:create, :destroy]

  get "/homes/about" => "homes#about", as: "about"
end
