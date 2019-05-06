class Brand < ApplicationRecord
	has_many :products, :dependent => :delete_all
	validates :name, presence: true
	validates :name, :uniqueness => true
	before_save :uppercase_name
	def uppercase_name
		self.name.upcase!
	end
end
