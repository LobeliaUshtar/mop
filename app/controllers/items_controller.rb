class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Yay for more in the pantry"
      redirect_to items_path
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit!
    end
  # private end
end