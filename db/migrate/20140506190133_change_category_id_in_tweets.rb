class ChangeCategoryIdInTweets < ActiveRecord::Migration
  def change
    rename_column :tweets, :category_id, :tweet_category_id
    change_column_default :tweets, :is_retweet, 0
    change_column_default :tweets, :language, "en"
    change_column_default :tweets, :is_reply, 0
    change_column_default :tweets, :is_sensitive, 0
    change_column_default :tweets, :has_image, 0
    change_column_default :tweets, :has_link, 0

  end
end
