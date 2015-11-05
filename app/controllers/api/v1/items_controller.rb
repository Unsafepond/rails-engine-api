class Api::V1::ItemsController < ApplicationController
	respond_to :json

	def show
		respond_with find_item
	end

	def find
		respond_with Item.find_by(find_params)
	end

	def find_all
		respond_with Item.where(find_params)
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

	def most_items
		respond_with Item.most_items(params[:quantity])
	end

	private

		def find_item
	    Item.find(params[:id])
	  end

	  def find_params
    	params.permit(:id,
                  :item_id,
                  :name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at)
  	end
	  
end
