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

	def revenue
		respond_with find_merchant.revenue(params)
	end

	def favorite_customer
		respond_with find_merchant.favorite_customer
	end

	private

		def find_merchant
	  	Merchant.find(params[:id])
	  end
	  
end
