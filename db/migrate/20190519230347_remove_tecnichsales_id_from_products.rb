class RemoveTecnichsalesIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :tecnichsales_id, :integer
  end
end
