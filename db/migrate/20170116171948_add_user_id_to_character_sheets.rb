class AddUserIdToCharacterSheets < ActiveRecord::Migration[5.0]
  def change
    add_column :character_sheets, :user_id, :integer
  end
end
