class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    case params[:filter]
    when 'ended'
      @events = Event.ended
    when 'upcoming'
      @events = Event.upcoming
    when 'all'
      @events = Event.all
    else
      @events = Event.happening_now
    end
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully created!"
      redirect_to @event
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event successfully updated!"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Event successfully deleted!"
    redirect_to events_url
  end

  private
    def event_params
      params.require(:event).permit!
    end

    def set_event
      @event = Event.find_by!(slug: params[:id])
    end
  # private end
end
