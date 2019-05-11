class CreateReqitems < ActiveRecord::Migration[5.2]
  def change
    create_table :reqitems do |t|
      t.string :amount

      t.timestamps
    end
  end
end
