class TopicsController < ApplicationController
  def index # indexアクションを作成(リソース一覧を表示)
    @topics = Topic.all # View(index.html.erb)を作成, 投稿一覧を表示できる
  end
  
  def new
    @topic = Topic.new # form_forに渡すインスタンス変数(@topic) newメソッドで何も情報を持っていないので自動的にcreateアクションへ
  end
  
  def create # createアクションでリソースを追加しsaveメソッドを使用(保存), Controllerで保存されたインスタンス変数は,そのControllerに紐づくViewに値が渡される
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました' # success = 緑
    else
      flash.now[:danger] = "投稿に失敗しました" # danger = 赤
      render :new # 表示したいビュー(usersディレクトリ内のnew.html.erbが表示)
    end
  end
  
  private # クラス外からは呼び出せない
  def topic_params # ストロングパラメーター
    params.require(:topic).permit(:image, :description)
  end
end
