class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date_start
      t.date :date_end
      t.text :details

      t.timestamps
    end
  end
end
