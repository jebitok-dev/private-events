class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.future
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:info] = 'The event was created successfully.'
      redirect_to events_path
    else
      flash[:info] = @events.errors.full_messages
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
  end

  def add_user_to_event(user)
    attendees << user
    redirect_to user
  end
  helper_method :add_user_to_event

  private

  def event_params
    params.require(:event).permit(:event_name, :description, :date, :location)
  end
end
