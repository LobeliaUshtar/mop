class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :variety
      t.string :category
      t.integer :count
      t.integer :shop

      t.timestamps
    end
  end
end
