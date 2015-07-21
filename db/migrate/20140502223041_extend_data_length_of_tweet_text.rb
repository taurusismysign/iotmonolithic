class ExtendDataLengthOfTweetText < ActiveRecord::Migration
  def change
    change_column :tweets, :tweet_text, :string, :limit => 786
  end
end
