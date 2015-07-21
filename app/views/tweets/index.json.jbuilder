json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :user_id, :handle, :category_id, :sequence_id, :status
  json.url tweet_url(tweet, format: :json)
end
