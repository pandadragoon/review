class PostsController < ApplicationController

  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
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

  def update
    @post = Post.find(params[:id])

  end
end

private

def post_params
 params.require(:post).permit(:title, :description, :rating, :body, category_ids: [])
end