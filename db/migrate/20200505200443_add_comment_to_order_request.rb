class AddCommentToOrderRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :order_requests, :comment, :text
  end
end
