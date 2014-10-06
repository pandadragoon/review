class CategoriesController < ApplicationController
  before_action :require_user, only: [:create, :new, :destroy]
  before_action :require_admin, only: [:create, :new, :destroy]
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You created a new category."
      redirect_to categories_path
    else
      flash[:error] = "Your category did not save"
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:format])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
