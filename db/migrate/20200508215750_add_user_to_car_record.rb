class AddUserToCarRecord < ActiveRecord::Migration[6.0]
  def change
    add_reference :car_records, :user, null: false, foreign_key: true, default: 1
  end
end
