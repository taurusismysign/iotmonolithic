json.array!(@experts) do |expert|
  json.extract! expert, :id, :handle, :tweet_category_id, :sequence_id, :user_id, :is_active
  json.url expert_url(expert, format: :json)
end
