class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  
  def index
    case params[:filter]
    when 'all'
      @inventories = Inventory.all
    else
      @inventories = Inventory.low
    end
    
  end

  def show; end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.name = params[:inventory][:name].titleize
    if @inventory.save
      flash[:notice] = "Yay for more in the pantry!"
      redirect_to @inventory
    else
      render :new
    end
  end

  def edit; end

  def update
    @inventory.name = params[:inventory][:name].titleize
    if @inventory.update(inventory_params)
      flash[:notice] = "Inventory successfully updated!"
      redirect_to @inventory
    else
      render :edit
    end
  end

  def destroy
    @inventory.destroy
    flash[:notice] = "Inventory successfully deleted!"
    redirect_to inventories_url
  end

  private
    def inventory_params
      params.require(:inventory).permit!
    end

    def set_inventory
      @inventory = Inventory.find_by!(slug: params[:id])
    end
  # private end
end