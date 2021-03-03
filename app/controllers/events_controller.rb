class EventsController < ApplicationController

  # GET /events or /events.json
  def index
    # @events = Event.all.order('created_at DESC')
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

   # Use callbacks to share common setup or constraints between actions.
   def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit( :event, :date, :location, :invite)
  end
end
