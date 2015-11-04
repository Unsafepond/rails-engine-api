class Api::V1::MerchantsController < ApplicationController
	respond_to :json

	def show
		respond_with find_merchant
	end

	def items
		respond_with find_merchant.items
	end

	def invoices
		respond_with find_merchant.invoices
	end
end
