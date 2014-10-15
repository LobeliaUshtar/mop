class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :count
      t.integer :shop

      t.timestamps
    end
  end
end
