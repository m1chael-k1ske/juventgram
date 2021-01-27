Rails.application.routes.draw do
  
  get 'sessions/new'
  root 'pages#index' # controller#action
  get 'pages/help' # path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users # まとめて定義
  get    '/login',   to: 'sessions#new' # ログインするためのフォームを表示するページを取得 = GET /URL sessions_controller_new_action
  post   '/login',   to: 'sessions#create'# メールアドレス, パスワードを送信してもらい, データを元にSessionを作成 = POST /URL sessions_controller_create_action
  delete '/logout',  to: 'sessions#destroy'# ログアウトでSessionを削除 = DELETE /URL sessions_controller_destroy_action
end
