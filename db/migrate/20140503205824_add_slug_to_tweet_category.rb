class AddSlugToTweetCategory < ActiveRecord::Migration
  def change
    add_column :tweet_categories, :slug, :string
    add_index :tweet_categories, :slug, unique: true
  end
end
