class AddUserToBasket < ActiveRecord::Migration[5.2]
  def change
    add_reference :baskets, :user, foreign_key: true
  end
end
