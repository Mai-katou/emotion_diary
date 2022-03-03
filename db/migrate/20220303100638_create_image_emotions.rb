class CreateImageEmotions < ActiveRecord::Migration[6.1]
  def change
    create_table :image_emotions do |t|
      t.integer :diary_id,null: false
      t.integer :emotion_id,null: false
      t.timestamps
    end
  end
end
