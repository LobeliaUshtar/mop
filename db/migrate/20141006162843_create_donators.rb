class CreateDonators < ActiveRecord::Migration
  def change
    create_table :donators do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :address
      t.string :phone
      t.string :hours
      t.text :description
      t.string :logo_link
      t.string :donation
      t.boolean :current, default: true

      t.timestamps
    end
  end
end
