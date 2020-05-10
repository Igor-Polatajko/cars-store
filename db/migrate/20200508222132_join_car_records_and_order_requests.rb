class JoinCarRecordsAndOrderRequests < ActiveRecord::Migration[6.0]
  def change
    create_join_table :car_records, :order_requests do |t|
      t.index :car_record_id
      t.index :order_request_id
    end
  end
end
