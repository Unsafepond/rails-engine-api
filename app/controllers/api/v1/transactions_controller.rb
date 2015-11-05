class Api::V1::TransactionsController < ApplicationController
	respond_to :json

	def show
		respond_with find_transaction
	end

	def find
		respond_with Transaction.find_by(find_params)
	end

	def find_all
		respond_with Transaction.where(find_params)
	end

	def invoice
		respond_with find_transaction.invoice
	end

	private

		def find_transaction
	    Transaction.find(params[:id])
	  end

	  def find_params
    	params.permit(:id,
                  :transaction_id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at )
  end
	  
end
