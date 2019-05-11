class Order < ApplicationRecord
has_many :reqitems
belongs_to :user
end
