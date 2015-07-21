class AddColumnsMoreToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_embed, :string
    change_column :tweets, :tweet_embed, :string, :limit => 786
    add_column :tweets, :tweet_id, :string
    change_column :tweets, :tweet_text, :string, :limit => 300
  end
end
