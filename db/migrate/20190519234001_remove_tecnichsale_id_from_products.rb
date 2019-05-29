class RemoveTecnichsaleIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :tecnichsale_id, :integer
  end
end
