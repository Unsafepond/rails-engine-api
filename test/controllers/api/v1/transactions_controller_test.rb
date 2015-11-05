require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#show" do
  	transaction = transactions(:two)
    get :show, id: transaction.id, format: :json
    
    assert_equal "success", json_response["result"]
  end

  test "#find" do
    transaction = Transaction.create(result: "done")
    get :find, id: transaction.id, format: :json
    
    assert_equal "done", json_response["result"]
  end

  test "#find_all" do
    transaction = Transaction.create(result: "done")
    Transaction.create(result: "done")

    get :find_all, result: "done", format: :json
    
    assert_equal 2, json_response.count
  end

  test "#invoice" do
  	transaction = transactions(:two)
    invoice = Invoice.create(status: "test")
    transaction.update_attributes(invoice_id: invoice.id)

    get :invoice, id: transaction.id, format: :json
    
    assert_equal "test", json_response["status"]
  end
end
