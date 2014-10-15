class CreateCharacterizations < ActiveRecord::Migration
  def change
    create_table :characterizations do |t|
      t.references :inventory, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
