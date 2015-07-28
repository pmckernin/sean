json.array!(@invites) do |invite|
  json.extract! invite, :id, :sender_uid, :recipient_uid, :event_id
  json.url invite_url(invite, format: :json)
end
