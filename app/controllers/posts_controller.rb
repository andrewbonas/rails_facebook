class PostsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @posts = current_user.posts.new
    @posts =Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user)).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to root_path, notice: "Post Created"
      else
        redirect_to root_path, alert: "Post cannot be blank"
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

  def like
    @post = Post.find(params[:id])
    @post.likers << current_user
    redirect_back fallback_location: posts_path
  end

  def unlike
    @post = Post.find(params[:id])
    @post.likers.delete(current_user)
    redirect_back fallback_location: posts_path
  end
  
  private

  def post_params
    params.permit(:body)
  end
end
