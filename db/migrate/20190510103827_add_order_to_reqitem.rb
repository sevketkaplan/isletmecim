class AddOrderToReqitem < ActiveRecord::Migration[5.2]
  def change
    add_reference :reqitems, :order, foreign_key: true
  end
end
