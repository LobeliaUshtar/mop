class AddSlugToDonators < ActiveRecord::Migration
  def change
    add_column :donators, :slug, :string
  end
end
