json.extract! event, :id, :topic, :start_date, :end_date, :city, :created_at, :updated_at
json.url event_url(event, format: :json)
