class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id, index: true
      t.string :name
      t.string :description
      t.string :image_url
      t.boolean :swapped
      t.timestamps null: false
    end
  end
end
