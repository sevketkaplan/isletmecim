class Salesproduct < ApplicationRecord
belongs_to :product
belongs_to :user
belongs_to :basket
end
