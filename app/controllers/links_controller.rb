class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @links = Link.all
  end

  def show; end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link successfully created!"
      redirect_to @link
    else
      render :new
    end
  end

  def edit; end

  def update
    if @link.update(link_params)
      flash[:notice] = "Link successfully updated!"
      redirect_to @link
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    flash[:notice] = "Link successfully deleted!"
    redirect_to links_url
  end

  private
    def link_params
      params.require(:link).permit!
    end

    def set_link
      @link = Link.find_by!(slug: params[:id])
    end
  # private end
end