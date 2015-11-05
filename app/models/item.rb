class Item < ActiveRecord::Base
	belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items

	def self.most_revenue(item_quantity)
		sorted = Item.all.sort_by do |item| 
			[item, item.invoices.shipped.sum("quantity * (unit_price/100)")]
		end
		sorted.first(item_quantity)
	end
end
