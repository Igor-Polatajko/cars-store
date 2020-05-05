class CreateOrderRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :order_requests do |t|
      t.string :name
      t.string :surname
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
