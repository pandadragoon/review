class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:review_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Your comment was created.'
      redirect_to review_path(@post)
    else
      render 'posts/show'
    end
  end
end
