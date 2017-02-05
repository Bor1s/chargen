class CreateShareableLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :shareable_links do |t|
      t.references :character_sheet, foreign_key: true
      t.string :token
      t.index :token

      t.timestamps
    end
  end
end
