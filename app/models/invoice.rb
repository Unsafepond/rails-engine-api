class Invoice < ActiveRecord::Base
	has_many :transactions
	has_many :invoice_items
	has_many :items, through: :invoice_items
	belongs_to :merchant
	belongs_to :customer


	def self.shipped
		self.where(status: "shipped")
	end

	def self.pending
		joins(:transactions).where(status: "pending")
	end
end
