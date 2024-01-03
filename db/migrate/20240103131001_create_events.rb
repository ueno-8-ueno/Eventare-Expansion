class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :member_id, null: false
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :start_at, null: false
      t.string :end_at, null: false
      
      t.boolean :is_done, default: false

      t.timestamps
    end
  end
end
