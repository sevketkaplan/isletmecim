class Salesproduct < ApplicationRecord
belongs_to :product
has_many :users
end
