class Customer < ActiveRecord::Base
	has_many :invoices
	has_many :transactions, through: :invoices

	def favorite_merchant
		invoices.shipped.sort_by { |invoice| invoice.merchant}.first.merchant
	end
end
