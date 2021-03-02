class EventsController < ApplicationController

  # GET /events or /events.json
  def index
    @events = Event.all.order('created_at DESC')
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  # def create
  #   @event = User.find(session[:id]).created_events.build(event_params)
  #   if @event.save
  #     redirect_to @event
  #   else
  #     render :new
  #   end
  # def create
  #   @event = Event.find(params)[:event_id]

  #   respond_to do |format|
  #     if @event.save
  #       format.html { redirect_to :root_path, notice: "Event was successfully created." }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    current_event = Event.find(event_params[:event_id])
    @event = current_event.events.build(events_params)
    if @event.save
      flash[:success] = "Success"
      redirect_to root_url
    else
      flash[:error] = "Fail"
    end
end

   # Use callbacks to share common setup or constraints between actions.
   def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit( :event_id, :event, :date, :location, :invite)
  end


end
