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
		# binding.pry
		respond_with find_invoice.customer
	end
end
