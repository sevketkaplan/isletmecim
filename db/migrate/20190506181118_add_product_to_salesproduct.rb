class AddProductToSalesproduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :salesproducts, :product, foreign_key: true
  end
end
