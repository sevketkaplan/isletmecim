class Product < ApplicationRecord
	has_many :salesproducts
	has_many :reqitems
	has_many :tecnichsales
	belongs_to :brand
	validates :name, presence: true
	validates :amount, presence: true
	validates :unit_price, presence: true

end
