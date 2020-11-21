class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
      if @post.save
        redirect_to post_path(@post), notice: "Comment Posted"
      else
        redirect_to post_path(@post), alert: "Unable to Post Comment"
      end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: "Comment Deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
