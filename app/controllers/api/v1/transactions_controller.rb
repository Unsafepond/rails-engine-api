class Api::V1::TransactionsController < ApplicationController
	respond_to :json

	def show
		respond_with find_transaction
	end

	def invoice
		respond_with find_transaction.invoice
	end
end
