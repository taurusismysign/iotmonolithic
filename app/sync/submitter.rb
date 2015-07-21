
module Submitter

  # returns submission object
  def self.Add(tweet, exp, embed)
    t = Tweet.new

    t.handle = tweet[:user][:screen_name].downcase
    t.tweet_category_id = exp.tweet_category_id
    t.tweet_text = tweet[:attrs][:retweeted_status].present? ? tweet[:attrs][:retweeted_status][:text] : tweet[:attrs][:text]
    t.is_retweet = tweet[:attrs][:retweeted_status].present? ? 1 : 0
    t.has_link = tweet[:attrs][:entities][:urls].present? ? 1 : 0
    t.has_hashtags = tweet[:attrs][:entities][:hashtags].present? ? 1 : 0
    t.hashtags = tweet[:attrs][:entities][:hashtags].present? ? tweet[:attrs][:entities][:hashtags] : ""
    t.tweet_id = tweet[:attrs][:id_str]
    t.tweet_embed = embed[:attrs][:html]
    t.tweet_created_dt = embed[:attrs][:created_at]
    t.has_image = tweet[:attrs][:entities][:media].present? ? 1 : 0
    t.has_user_mention = tweet[:attrs][:entities][:user_mentions].present? ? 1 : 0
    t.is_reply = tweet[:attrs][:in_reply_to_status_id].present? ? 1 : 0
    t.is_sensitive = tweet[:attrs][:possibly_sensitive]
    t.language = tweet[:attrs][:lang]
    t.save

    return t
  end
end
