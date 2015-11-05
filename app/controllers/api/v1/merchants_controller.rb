class Api::V1::MerchantsController < ApplicationController
	respond_to :json

	def show
		respond_with find_merchant
	end

	def find
		respond_with Merchant.find_by(find_params)
	end

	def find_all
		respond_with Merchant.where(find_params)
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

	def customers_with_pending_invoices
		respond_with find_merchant.customers_with_pending_invoices
	end

	def most_revenue
		respond_with Merchant.most_revenue(params[:quantity])
	end

	private

		def find_merchant
	  	Merchant.find(params[:id])
	  end

	  def find_params
	  	params.permit(:id,
                  :name,
                  :merchant_id,
                  :created_at,
                  :updated_at,
                  :quantity,
                  :date)
  end
	  
end
