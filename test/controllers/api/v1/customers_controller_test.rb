require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#show" do
  	dude = customers(:two)
    get :show, id: dude.id, format: :json
    
    assert_equal "things2", json_response["last_name"]
  end

  test "#find" do
    customer = Customer.create(first_name: "dude")
    get :find, id: customer.id, format: :json
    
    assert_equal "dude", json_response["first_name"]
  end

  test "#find_all" do
    customer = Customer.create(first_name: "dude")
    Customer.create(first_name: "dude")

    get :find_all, first_name: customer.first_name, format: :json
    
    assert_equal 2, json_response.count
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

  test "#favorite_merchant" do
    customer = customers(:two)
    merchant = merchants(:one)
    merchant2 = merchants(:two)
    invoice1 = Invoice.create(status: "shipped", merchant_id: merchant.id, customer_id: customer.id)
    invoice2 = Invoice.create(status: "shipped", merchant_id: merchant2.id, customer_id: customer.id)
    invoice3 = Invoice.create(status: "shipped", merchant_id: merchant2.id, customer_id: customer.id)
    

    get :favorite_merchant, id: customer.id, format: :json
    
    assert_equal "dude", json_response["name"]
  end
end
