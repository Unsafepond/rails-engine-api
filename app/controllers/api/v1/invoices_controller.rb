class Api::V1::InvoicesController < ApplicationController
	respond_to :json

	def show
		respond_with find_invoice
	end

	def find
		respond_with Invoice.find_by(find_params)
	end

	def find_all
		respond_with Invoice.where(find_params)
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

	private

		def find_invoice
  		Invoice.find(params[:id])
  	end

  	def find_params
    	params.permit(:id,
                  :invoice_id,
                  :customer_id,
                  :merchant_id,
                  :status,
                  :created_at,
                  :updated_at)
  	end
  	
end
