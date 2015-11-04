class Invoice < ActiveRecord::Base
	has_many :transactions
	has_many :invoice_items
	has_many :items, through: :invoice_items
	has_one :merchant
	belongs_to :customer
end
