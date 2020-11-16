class PostsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to root_path, notice: "Post Created"
      else
        render :new, alert: "Post Failed"
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post Deleted"
  end
  
  private

  def post_params
    params.permit(:body)
  end
end
