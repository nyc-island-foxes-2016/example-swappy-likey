class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_swipe_id, index: true
      t.integer :second_swipe_id, index: true
      t.datetime :swapped_at
      t.timestamps null: false
    end
  end
end
