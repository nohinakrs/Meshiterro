Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  #↑アプリケーションを発展させようの章で追記。管理者権限を実装
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] # ユーザー削除機能実装のため、ここを追加
  end
  #↑管理者ダッシュボードへのルート設定

#↓構造の最適化、パブリックに各機能を格納（管理者権限実装の章にて）
# scope module: :publicの記述により、URLの変更なく実装している。
scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about
    #get 'post_images/new' get 'post_images/index' get 'post_images/show'の短縮表記、resourcesの一括生成機能の範囲を限定して実現している
    #:createを追加（10章）
    #:destroyリンクを追加(13章)
    #コメント機能のための追記(18章)
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      #19章のルーティング、単数形のresourceを使うとURLにidが含まれなくなる。
      # resourceそれ自身のidが分からなくても、関連する他のモデルのidから特定できる時に用いる。
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  #usersのルーティング(14章)
  # 以下の行のonly: []内にupdateを追加(14章)
  resources :users, only: [:show, :edit, :update]
end
