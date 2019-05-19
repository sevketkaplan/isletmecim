class AddBasketToSalesproduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :salesproducts, :basket, foreign_key: true
  end
end
