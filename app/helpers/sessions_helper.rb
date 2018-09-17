module SessionsHelper
  #ログイン中のユーザを取得するメソッド
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    
  end
  #ユーザーがログインしていればtrue、その他ならfalseを返すメソッド
  def logged_in?
    current_user.present?
  end
end
