class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :own_item_id, index: true
      t.integer :other_item_id, index: true
      t.boolean :direction_like
      t.timestamps null: false
    end
  end
end
