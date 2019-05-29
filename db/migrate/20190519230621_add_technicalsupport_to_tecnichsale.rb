class AddTechnicalsupportToTecnichsale < ActiveRecord::Migration[5.2]
  def change
    add_reference :tecnichsales, :technicalsupport, foreign_key: true
  end
end
