require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#show" do
  	invoice = invoices(:two)
    get :show, id: invoice.id, format: :json
    
    assert_equal "shipped", json_response["status"]
  end

  test "#transactions" do
  	invoice = invoices(:two)
    Transaction.create(credit_card_number: "test", invoice_id: invoice.id)
    Transaction.create(credit_card_number: "test2", invoice_id: invoice.id)
    get :transactions, id: invoice.id, format: :json
    # binding.pry
    assert_equal "test", json_response.first["credit_card_number"]
    assert_equal "test2", json_response[1]["credit_card_number"]
  end
end
