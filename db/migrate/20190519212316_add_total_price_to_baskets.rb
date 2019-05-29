class AddTotalPriceToBaskets < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :total_price, :float
  end
end
