class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :handle
      t.integer :tweet_category_id
      t.integer :sequence_id
      t.integer :user_id
      t.integer :is_active

      t.timestamps
    end
  end
end
