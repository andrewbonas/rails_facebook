class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        redirect to root_path, notice: "Post Created"
      else
        render :new, alert: "Post Failed"
      end
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
