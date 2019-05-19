class Basket < ApplicationRecord
belongs_to :user
has_many :salesproducts
end
