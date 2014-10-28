class AddSlugToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :slug, :string
  end
end
