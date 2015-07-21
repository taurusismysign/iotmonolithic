class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :handle
      t.integer :category_id
      t.integer :sequence_id
      t.string :tweet_text
      t.integer :is_retweet
      t.datetime :tweet_created_dt
      t.integer :has_link

      t.timestamps
    end
  end
end
