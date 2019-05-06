class AddUserToCustomerbalance < ActiveRecord::Migration[5.2]
  def change
    add_reference :customerbalances, :user, foreign_key: true
  end
end
