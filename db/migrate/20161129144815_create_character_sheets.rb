class CreateCharacterSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :character_sheets do |t|
      t.string :type
      t.text :data_fields

      t.timestamps
    end
  end
end
