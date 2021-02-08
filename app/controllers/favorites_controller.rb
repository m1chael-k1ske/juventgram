class FavoritesController < ApplicationController
  def index # いいね一覧を表示する, indexアクション
    @favorite_topics = current_user.favorite_topics # ログインしているユーザーがいいねしているTopicを取得, Viewに表示 
  end
  
  def create
    favorite = Favorite.new # Favoriteクラスのローカル変数favoriteを生成
    favorite.user_id = current_user.id # ログインしているユーザーのidを格納
    favorite.topic_id = params[:topic_id] # いいねしたTopicのidを取得
    
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました' # success = 緑
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました' # danger = 赤
    end
  end
  
  def destroy
    Favorite.find_by(params[:topic_id]).destroy # ハートマークをクリックするとfavoriteテーブルからカラムを削除する
    flash[:success] = "お気に入りを解除しました"
    redirect_to topics_path
  end
  
  # def destroy
  #  favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
  # favorite.destroy if favorite.present?

  # if favorite.destroyed?
  #  redirect_to topics_path, success: 'お気に入りを解除しました'
  # else
  #  redirect_to topics_path, success: 'お気に入り解除に失敗しました'
  # end
end
