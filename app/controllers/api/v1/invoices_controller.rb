class Api::V1::InvoicesController < ApplicationController
	respond_to :json

	def show
		respond_with find_invoice
	end

	def transactions
		respond_with find_invoice.transactions
	end

	def invoice_items
		respond_with find_invoice.invoice_items
	end

	def items
		respond_with find_invoice.items
	end

	def customer
		respond_with find_invoice.customer
	end

	def merchant
		respond_with find_invoice.merchant
	end
end
