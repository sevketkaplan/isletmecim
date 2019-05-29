class AddKeyToTechnicalsupports < ActiveRecord::Migration[5.2]
  def change
    add_column :technicalsupports, :key, :string
  end
end
