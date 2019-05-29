class AddTecnichsalesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :tecnichsales, foreign_key: true
  end
end
