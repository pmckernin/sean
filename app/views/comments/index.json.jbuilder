json.array!(@comments) do |comment|
  json.extract! comment, :id, :event_id, :user_uid, :content
  json.url comment_url(comment, format: :json)
end
