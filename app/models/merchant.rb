class Merchant < ActiveRecord::Base
	has_many :items
	has_many :invoices

	def revenue(params)
		if params[:date]
			revenue_by_date(params[:date])
		else
			{ revenue: invoices.shipped.joins(:invoice_items).sum("quantity * (unit_price/100)") }
		end
	end

	def revenue_by_date(date)
		{revenue: invoices.shipped.where(created_at: date).joins(:invoice_items).sum("quantity * (unit_price/100)") }
	end

	def favorite_customer
		invoices.shipped.max_by { |invoice| invoice.customer}.customer
	end

	def customers_with_pending_invoices
		invoices.pending.flat_map{ |invoice| Customer.find(invoice.customer_id)}
	end
end
