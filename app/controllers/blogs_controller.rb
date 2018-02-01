class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy ]
  before_action :set_current_user, only: [:new, :edit, :show]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create 
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
    # 投稿完了メールを送信
      BlogMailer.blog_mail(@blog).deliver
    # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
    # 入力フォームを再描画します。
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_current_user
    unless logged_in?
    flash[:warning] = 'ログインして下さい'
    redirect_to new_session_path
    end
  end

end
