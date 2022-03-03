class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :user_id , null: false
      t.integer :diary_id, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
