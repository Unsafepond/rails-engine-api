class Api::V1::InvoiceItemsController < ApplicationController
	respond_to :json

	def show
		respond_with find_invoice_item
	end

	def item
		respond_with find_invoice_item.item
	end

	def invoice
		respond_with find_invoice_item.invoice
	end

	private
	
		def find_invoice_item
  		InvoiceItem.find(params[:id])
  	end

end
