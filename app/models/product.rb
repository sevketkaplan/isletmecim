class Product < ApplicationRecord
	has_many :salesproducts
	belongs_to :brand
	validates :name, presence: true
	validates :amount, presence: true
	validates :unit_price, presence: true
end
