class Api::V1::CustomersController < ApplicationController
	respond_to :json

	def show
		respond_with find_customer
	end

	def invoices
		respond_with find_customer.invoices
	end

	def transactions
		respond_with find_customer.transactions
	end

	def favorite_merchant
		respond_with find_customer.favorite_merchant
	end

	private

		def find_customer
			Customer.find(params[:id])
		end

end
