class InventoriesController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @categories = @inventory.categories
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      flash[:notice] = "Yay for more in the pantry!"
      redirect_to @inventory
    else
      render :new
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])
    if @inventory.update(inventory_params)
      flash[:notice] = "Inventory successfully updated!"
      redirect_to @inventory
    else
      render :edit
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = "Inventory successfully deleted!"
    redirect_to inventories_url
  end

  private
    def inventory_params
      params.require(:inventory).permit!
    end
  # private end
end