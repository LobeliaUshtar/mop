class DonatorsController < ApplicationController
  def index
    @donators = Donator.all
  end

  def show
    @donator = Donator.find(params[:id])
  end

  def new
    @donator = Donator.new
  end

  def create
    @donator = Donator.new(donator_params)
    if @donator.save
      flash[:notice] = "Donator successfully created!"
      redirect_to @donator
    else
      render :new
    end
  end

  def edit
    @donator = Donator.find(params[:id])
  end

  def update
    @donator = Donator.find(params[:id])
    if @donator.update(donator_params)
      flash[:notice] = "Donator successfully updated!"
      redirect_to @donator
    else
      render :edit
    end
  end

  def destroy
    @donator = Donator.find(params[:id])
    @donator.destroy
    flash[:notice] = "Donator successfully deleted!"
    redirect_to donators_url
  end

  private
    def donator_params
      params.require(:donator).permit!
    end
  #private end
end