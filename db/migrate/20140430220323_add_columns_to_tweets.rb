class AddColumnsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :is_reply, :integer
    add_column :tweets, :reply_handle, :string
    add_column :tweets, :has_hashtags, :integer
    add_column :tweets, :hashtags, :string
    add_column :tweets, :has_user_mention, :integer
    add_column :tweets, :user_mention_handle, :string
    add_column :tweets, :geo, :string
    add_column :tweets, :is_sensitive, :integer
    add_column :tweets, :user_location, :string
  end
end
