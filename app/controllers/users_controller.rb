class UsersController < ApplicationController #Railsの慣習でControllerは必ず複数形にする
  def new
    @user = User.new # form_forに渡すインスタンス変数(@user) newメソッドで何も情報を持っていないので自動的にcreateアクションへ
  end
  
  def create # createアクションでリソースを追加しsaveメソッドを使用(保存), Controllerで保存されたインスタンス変数は,そのControllerに紐づくViewに値が渡される
    @user = User.new(user_params)
    
    if @user.save
      redirect_to root_path, success: '登録が完了しました' # success = 緑
    else
      flash.now[:danger] = "登録に失敗しました" # danger = 赤
      render :new # 表示したいビュー(usersディレクトリ内のnew.html.erbが表示)
    end
  end
  
  private # クラス外からは呼び出せない
  def user_params # ストロングパラメーター
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
