class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :user_id, null: false
      t.text :diary_detail
      t.datetime :start_time, null: false
      t.boolean :is_favorited, null: false, default: "false"
      t.timestamps
    end
  end
end
