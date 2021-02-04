class ApplicationController < ActionController::Base # application_controllerはcontrollerで使用する共通のコードを指定
  protect_from_forgery with: :exception # クロスサイトリクエストフォージェリ<Railsのセキュリティ対策に必要な一文>

  add_flash_types :success, :info, :warning, :danger # フラッシュメッセージのキーを許可
  
  def current_user # current_userはViewとControllerのどちらでも使用したいからhelperとcontrollerの両方にメソッドを指定
    @current_user ||= User.find_by(id: session[:user_id]) # インスタンス変数がfalse(nil)の場合Userモデルから現在ログインしているユーザーidと一致する情報を代入
  end
  
  def logged_in? # # logged_in?メソッドは現在のユーザーがログインしているかどうか判別するメソッド
    !current_user.nil? # current_userがnilか判断
  end
  
  helper_method :current_user, :logged_in? # 重複コードの対策
end
