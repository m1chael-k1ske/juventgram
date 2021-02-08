class CommentsController < ApplicationController
  def new # リソースを新規作成
    @topic = Topic.find_by(params[:topic_id]) # コメント投稿画面で, Topic情報(id)を取得できないため投稿画面に移動する時にtopic_idを取得
    @comment = Comment.new # インスタンス変数
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました' # success = 緑
    else
      flash.now[:danger] = 'コメントに失敗しました' # danger = 赤
      render :new
    end
  end
  
  private
  def comment_params # ストロングパラメーター
    params.require(:comment).permit(:content, :topic_id, :user_id) # :commentをキーにrequireメソッドで抽出, permitメソッドを使用し, :content, :topic_id, :user_idカラムを取得
  end
end
