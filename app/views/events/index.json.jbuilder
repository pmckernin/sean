json.array!(@events) do |event|

  json.extract! event, :id, :description, :start_date, :end_date, :invite_only, :creator_uid, :location
  json.url event_url(event, format: :json)


end
