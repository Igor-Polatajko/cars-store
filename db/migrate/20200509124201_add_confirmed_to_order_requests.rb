class AddConfirmedToOrderRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :order_requests, :confirmed, :boolean
  end
end
