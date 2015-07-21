class CreateSinces < ActiveRecord::Migration
  def change
    create_table :sinces do |t|
      t.string :since_value

      t.timestamps
    end
  end
end
