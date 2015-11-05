class Api::V1::ItemsController < ApplicationController
	respond_to :json

	def show
		respond_with find_item
	end

	def invoice_items
		respond_with find_item.invoice_items
	end

	def merchant
		respond_with find_item.merchant
	end

	def most_revenue
		respond_with Item.most_revenue(params[:quantity])
	end

	private

		def find_item
	    Item.find(params[:id])
	  end
	  
end
