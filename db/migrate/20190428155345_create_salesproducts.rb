class CreateSalesproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :salesproducts do |t|
      t.integer :unit
      t.float :total_price

      t.timestamps
    end
  end
end
