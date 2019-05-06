class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.float :unit_price

      t.timestamps
    end
  end
end
