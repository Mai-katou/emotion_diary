class ChangeDataUserIdToDiary < ActiveRecord::Migration[6.1]
  def change
    change_column :diaries, :user_id, :integer
  end
end
