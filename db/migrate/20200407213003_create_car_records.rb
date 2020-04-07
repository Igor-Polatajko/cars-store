class CreateCarRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :car_records do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
