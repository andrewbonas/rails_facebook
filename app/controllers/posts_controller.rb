class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    
  def index
    @posts = Post.all
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

  def post_params
    params.require(:post).permit(:body)
  end
end
