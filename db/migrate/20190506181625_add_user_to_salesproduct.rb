class AddUserToSalesproduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :salesproducts, :user, foreign_key: true
  end
end
