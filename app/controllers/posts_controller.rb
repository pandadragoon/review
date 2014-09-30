class PostsController < ApplicationController

  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Your review was posted."
      redirect_to reviews_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Your review was updated"
      redirect_to root_path
    else
      render :new
    end

  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def user_review
    @user_review = UserReview.create(user_id: 1, post_id: params[:id], user_review: params[:user_review])
    redirect_to :back
  end
  private

  def post_params
    params.require(:post).permit(:title, :description, :rating, :body, category_ids: [])
  end
end

