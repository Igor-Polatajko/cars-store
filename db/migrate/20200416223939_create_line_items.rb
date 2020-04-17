class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :car_record, null: false, foreign_key: true
      t.belongs_to :saved_collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
