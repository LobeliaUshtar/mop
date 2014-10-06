class CreateDonators < ActiveRecord::Migration
  def change
    create_table :donators do |t|
      t.string :name
      t.string :website
      t.text :description
      t.string :logo_file_name
      t.boolean :current

      t.timestamps
    end
  end
end
