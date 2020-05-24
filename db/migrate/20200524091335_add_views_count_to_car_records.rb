class AddViewsCountToCarRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :car_records, :views_count, :integer, default: 0
  end
end
