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
    @user = User.find(params[:user_id])
    @event = @user.created_events.build(event_params)
    redirect_to user_path(@user).event
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:event_name, :description, :date, :location)
    end
end
