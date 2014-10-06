class PostsController < ApplicationController

  before_action :require_user, except: [:show, :index]
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Your review was posted."
      redirect_to reviews_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your review was updated"
      redirect_to root_path
    else
      render :new
    end

  end
  def destroy
    @post.destroy
    redirect_to root_path
  end

  def user_review
    @user_review = UserReview.create(user_id: 1, post_id: params[:id], user_review: params[:user_review])
    if @user_review.valid?
      flash[:notice] = "Thanks for rating the product."
    else
      flash[:error] = "You can only rate a product once"
    end
    redirect_to :back
  end
  private

  def post_params
    params.require(:post).permit(:title, :description, :rating, :body, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
