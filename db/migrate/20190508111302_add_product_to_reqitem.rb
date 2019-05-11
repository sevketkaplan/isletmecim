class AddProductToReqitem < ActiveRecord::Migration[5.2]
  def change
    add_reference :reqitems, :product, foreign_key: true
  end
end
