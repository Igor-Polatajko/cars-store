class AddCarRecordToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_requests, :car_record, null: false, foreign_key: true, default: 0
  end
end
