class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:review_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    if @comment.save
      flash[:notice] = 'Your comment was created.'
      redirect_to review_path(@post)
    else
      render 'posts/show'
    end
  end
end
