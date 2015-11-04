class Api::V1::ItemsController < ApplicationController
	respond_to :json

	def show
		respond_with find_item
	end

	def invoice_items
		respond_with find_item.invoice_items
	end
end
