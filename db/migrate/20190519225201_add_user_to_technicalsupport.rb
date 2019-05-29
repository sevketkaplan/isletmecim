class AddUserToTechnicalsupport < ActiveRecord::Migration[5.2]
  def change
    add_reference :technicalsupports, :user, foreign_key: true
  end
end
