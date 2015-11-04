class Api::V1::InvoicesController < ApplicationController
	respond_to :json

	def show
		respond_with find_invoice
	end

	def transactions
		respond_with find_invoice.transactions
	end
end
