class BlogsController < ApplicationController
  before_action:set_blog,only:[:edit,:update,:destroy]
  
  #一覧表示
  def index
    @blog = Blog.all.order(created_at: :desc)
  end
  #新規投稿
  def new
    @blog = Blog.new
  end
  #投稿作成
  def create
    @blog = Blog.create(blog_params)
      if @blog.save
    redirect_to blogs_path,notice:"ブログを作成しました"
      else
        render 'new'
      end
  end
  #投稿確認
  def confirm
    @blog = Blog.new(blog_params)
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

  
  private
    def blog_params
      params.require(:blog).permit(:content)
    end
    
    def set_blog
      @blog = Blog.find(params[:id])
    end
  
end
