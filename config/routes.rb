Rails.application.routes.draw do
  
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index' # controller#action
  get 'pages/help' # path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users # まとめて定義
  resources :topics # まとめて定義
  
  get    '/login',   to: 'sessions#new' # ログインするためのフォームを表示するページを取得, 転送<GET /URL sessions_controller_new_action>
  post   '/login',   to: 'sessions#create'# メールアドレス, パスワードを送信してもらい, データを元にSessionを作成, 処理を振り分け<POST /URL sessions_controller_create_action>
  delete '/logout',  to: 'sessions#destroy'# ログアウトでSessionを削除に処理を振り分け<DELETE /URL sessions_controller_destroy_action>
  
  get 'favorites/index' # path get = 取得
  post '/favorites', to: 'favorites#create' # post = 取得　path controller#action
  delete '/favorites', to: 'favorites#destroy' # delete = 削除 path controller#action
  
  get '/comments/:topic_id/new', to: 'comments#new', as: 'comments' # asを使い, ルーティングに名前を指定 comments_path
  post '/comments/:topic_id/create', to: 'comments#create', as: 'comments_create' # asを使い, ルーティングに名前を指定 comments_create_path
  resources :comments # まとめて定義
end
