class Merchant < ActiveRecord::Base
	has_many :items
	has_many :invoices

	def revenue(params)
		{ revenue: invoices.shipped.joins(:invoice_items).sum("quantity * (unit_price/100)") }
	end
end
