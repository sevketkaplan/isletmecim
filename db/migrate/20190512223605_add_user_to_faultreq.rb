class AddUserToFaultreq < ActiveRecord::Migration[5.2]
  def change
    add_reference :faultreqs, :user, foreign_key: true
  end
end
