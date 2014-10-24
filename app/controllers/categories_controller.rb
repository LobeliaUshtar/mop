class CategoriesController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.name = params[:category][:name].titleize
    if @category.save
      flash[:notice] = "Category successfully created!"
      redirect_to @category
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params[:category][:name].titleize
    if @category.update(category_params)
      flash[:notice] = "Category successfully updated!"
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category successfully deleted!"
    redirect_to categories_url
  end

  private
    def category_params
      params.require(:category).permit!
    end
  # private end
end