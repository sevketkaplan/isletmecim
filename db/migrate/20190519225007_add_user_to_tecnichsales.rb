class AddUserToTecnichsales < ActiveRecord::Migration[5.2]
  def change
    add_reference :tecnichsales, :user, foreign_key: true
  end
end
