class AddKeyToFaultreqs < ActiveRecord::Migration[5.2]
  def change
    add_column :faultreqs, :key, :string
  end
end
