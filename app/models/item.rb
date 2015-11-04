class Item < ActiveRecord::Base
	has_one :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items
end
