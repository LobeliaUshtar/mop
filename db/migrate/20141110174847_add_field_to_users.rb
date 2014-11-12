class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :availability_notes, :text
  end
end
