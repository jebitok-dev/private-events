class EventsController < ApplicationController
  # before_action only: %i[ create ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @user = User.find(params[:user_id])
    @event = Event.new
  end

  # POST /events or /events.json
  def create
    @event = User.find(session[:id]).created_events.build(event_params)
    if @event.save
      redirect_to @event
      scope.all
    else
      render :new
      scope.where(:events => true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_name, :description, :date, :location)
    end
end
