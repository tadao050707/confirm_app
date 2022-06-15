class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "Tweetしました！"
      else
        render :new
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "Tweetを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, notice:"Tweetを削除しました！"
    else
      render :index
    end
  end
  
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
