json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :sender_uid, :reciever_uid, :accepted
  json.url friendship_url(friendship, format: :json)
end
