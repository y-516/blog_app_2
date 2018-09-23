class SessionsController < ApplicationController
  def new
    render layout: false
  end

  def create
    #session/newから送られて来たアドレスを元にdbからユーザー情報を変数に格納
    user = User.find_by(email: params[:session][:email].downcase)
    #メールアドレスとパスワードの組み合わせが有効か調べるif文
    #authenticateメソッドの引数がuserと一致して入ればtrueを返す、一致していなければfalseを返す
     if user && user.authenticate(params[:session][:password])
       #ユーザーのブラウザ内のcookiesに暗号化されたユーザーIDが自動で生成
       session[:user_id] = user.id
       flash[:notice] = "#{user.name}さんでログインしました"
       redirect_to blogs_top_path
     else
       flash[:notice]='ログインに失敗しました'
       redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
