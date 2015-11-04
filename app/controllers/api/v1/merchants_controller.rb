class Api::V1::MerchantsController < ApplicationController
	respond_to :json

	def show
		respond_with Merchant.find(params[:id])
	end

	def items
		merchant = Merchant.find(params[:id])
		binding.pry
		respond_with merchant.items
	end
end
