class CreateEmotions < ActiveRecord::Migration[6.1]
  def change
    create_table :emotions do |t|
      t.string :emotion_name, null: false
      t.timestamps
    end
  end
end
