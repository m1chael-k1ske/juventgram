module ApplicationHelper
  def current_user # current_userとは現在ログインしているユーザーの情報を簡単に取得できるメソッド
    @current_user ||= User.find_by(id: session[:user_id]) # インスタンス変数がfalse(nil)の場合Userモデルから現在ログインしているユーザーidと一致する情報を代入
    # ||= は代入演算子で「左辺がFalse（nilまたは偽）の場合に右辺の値を左辺に代入」と言う意味
    # User.find_by(id: ~)」はUserモデルに保存されている〇〇のidを検索し, その情報を取得すると言う意味
    # session[:user_id]」は, ログイン中のユーザーのidを取得
  end
  
  def logged_in?
    !current_user.nil? # current_userがnilか判断
    # current_userメソッド内にあるインスタンス変数内に情報があればログイン, なければログアウト状態となる
  end
end
