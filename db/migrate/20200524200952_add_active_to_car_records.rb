class AddActiveToCarRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :car_records, :active, :boolean, default: true
  end
end
