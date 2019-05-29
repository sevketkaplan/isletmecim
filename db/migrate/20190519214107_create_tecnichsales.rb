class CreateTecnichsales < ActiveRecord::Migration[5.2]
  def change
    create_table :tecnichsales do |t|
      t.integer :unit
      t.float :total_price

      t.timestamps
    end
  end
end
