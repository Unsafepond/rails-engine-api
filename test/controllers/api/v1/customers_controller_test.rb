require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#show" do
  	dude = customers(:two)
    get :show, id: dude.id, format: :json
    
    assert_equal "things2", json_response["last_name"]
  end

  test "#invoices" do
  	customer = customers(:two)
    invoice = Invoice.create(status: "test1", customer_id: customer.id)

    get :invoices, id: customer.id, format: :json
    
    assert_equal "test1", json_response.first["status"]
  end

  test "#transactions" do
  	customer = customers(:two)
  	invoice = Invoice.create(customer_id: customer.id)
    transaction = Transaction.create(result: "test1", invoice_id: invoice.id)

    get :transactions, id: customer.id, format: :json
    
    assert_equal "test1", json_response.first["result"]
  end
end
