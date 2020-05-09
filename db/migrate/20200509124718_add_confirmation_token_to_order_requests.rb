class AddConfirmationTokenToOrderRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :order_requests, :confirmation_token, :string
  end
end
