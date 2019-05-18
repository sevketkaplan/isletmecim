class CreateFaultreqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faultreqs do |t|
      t.text :description

      t.timestamps
    end
  end
end
