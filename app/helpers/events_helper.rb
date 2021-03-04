module EventsHelper
  def display_attendees
    names = ''
    @event.atendees.each do |atendee|
      names << (content_tag :p, (link_to atendee.name, atendee))
    end
    names.html_safe
  end

  def display_events(events)
    events = ''
    events.each do |event|
      events << (content_tag :p, (link_to event.event, event))
    end
    events.html_safe
  end

  def add_event_path
    "/events/add/#{@event.id}"
  end

  def atendee?
    @event.atendees.exists?(session[:id])
  end

  def attend_link
    link_to 'Attend this event', add_event_path, method: :put if !atendee? && user_signed_in?
  end
end
