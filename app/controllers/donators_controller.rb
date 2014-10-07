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
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
    def donator_params
      params.require(:donator).permit!
    end
  #private end
end