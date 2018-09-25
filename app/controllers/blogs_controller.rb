class BlogsController < ApplicationController
  before_action:set_blog,only:[:edit,:update,:destroy]
  before_action:require_sign_in!,only:[:new,:edit,:ahow,:destroy]
  before_action:current_user

  #一覧表示
  def index
    @current_user = current_user
    @blog = Blog.all.order(created_at: :desc)
  end
  #新規投稿
  def new
    @blog = Blog.new
  end
  #投稿作成
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
      if @blog.save
        BlogMailer.blog_mail(@blog).deliver
        redirect_to blogs_path,notice:"ブログを作成しました"
      else
        render 'new'
      end
  end
  #投稿確認
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end
  #投稿編集
  def edit
  end
  #更新
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path,notice:"ブログを編集しました"
    else
      render 'edit'
    end
  end
  #削除
  def destroy
    @blog.destroy
    redirect_to blogs_path,notice:"ブログを削除しました"
  end
  #top
  def top
  end
  #お気に入り画面
  def show
    @blog = Blog.find_by(id:params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end


  private

  def blog_params
    params.require(:blog).permit(:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def require_sign_in!
    redirect_to new_session_path unless logged_in?
  end

end
