class SessionsController < ApplicationController
  def new
  end
  
  def create # # Sessionはモデルを持たないため, インスタンス変数の@userを代入する必要がない
    user = User.find_by(email: params[:session][:email]) # フォームから送信されたメールアドレスを取得し, 一致するユーザーがいるか検索<find_byメソッド>
    if user && user.authenticate(params[:session][:password]) # 該当のメールアドレスをもつuserが存在し, かつuserのパスワードが正しい, <authenticateメソッド = パスワードを引数としてユーザーの認証を行うことができる>
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user) # log_inメソッドでsession[:user_id]にログイン情報を保存
    session[:user_id] = user.id # sessionメソッド<sessionに暗号化した情報を保存するメソッド>
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
