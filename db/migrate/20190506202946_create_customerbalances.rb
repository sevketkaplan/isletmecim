class CreateCustomerbalances < ActiveRecord::Migration[5.2]
  def change
    create_table :customerbalances do |t|
      t.float :total_balance

      t.timestamps
    end
  end
end
