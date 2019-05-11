class RemoveUserIdFromReqitem < ActiveRecord::Migration[5.2]
  def change
    remove_column :reqitems, :user_id, :integer
  end
end
