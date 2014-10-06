class DonatorsController < ApplicationController
  def index
    @donators = Donator.all
  end

  def show
    
  end

  def new
    @donator = Donator.new
  end
end
