class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, index: true
      t.integer :match_id, index: true
      t.text :text
      t.timestamps null: false
    end
  end
end
