json.extract! event, :id, :event, :date, :location, :invite, :created_at, :updated_at
json.url event_url(event, format: :json)
