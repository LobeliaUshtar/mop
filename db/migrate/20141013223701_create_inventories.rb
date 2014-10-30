class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :pref_size
      t.boolean :running_low

      t.timestamps
    end
  end
end
