class CreateTechnicalsupports < ActiveRecord::Migration[5.2]
  def change
    create_table :technicalsupports do |t|
      t.float :workmanship_price
      t.float :total_price
      t.text :description

      t.timestamps
    end
  end
end
