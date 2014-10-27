class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :website
      t.text :comments

      t.timestamps
    end
  end
end
