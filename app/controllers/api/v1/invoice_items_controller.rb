class Api::V1::InvoiceItemsController < ApplicationController
	respond_to :json

	def show
		respond_with find_invoice_item
	end

	def item
		respond_with find_invoice_item.item
	end
end
