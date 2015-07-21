class AddHasImageToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :has_image, :integer
  end
end
