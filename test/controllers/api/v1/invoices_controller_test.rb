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
    
    assert_equal "test", json_response.first["credit_card_number"]
    assert_equal "test2", json_response[1]["credit_card_number"]
  end

  test "#invoice_items" do
  	invoice = invoices(:two)
    InvoiceItem.create(unit_price: 1337, invoice_id: invoice.id)
    InvoiceItem.create(unit_price: 58008, invoice_id: invoice.id)
    get :invoice_items, id: invoice.id, format: :json
   
    assert_equal 1337, json_response.first["unit_price"]
    assert_equal 58008, json_response[1]["unit_price"]
  end

  test "#items" do
  	invoice = invoices(:two)
  	item = items(:two)
    InvoiceItem.create(unit_price: 1337, invoice_id: invoice.id, item_id: item.id)
    get :items, id: invoice.id, format: :json
    
    assert_equal "this is an item", json_response.first["name"]
  end

  test "#customer" do
  	customer = Customer.create(first_name: "the dude")
  	invoice = invoices(:two)
    invoice.update_attributes(customer_id: customer.id)
    get :customer, id: invoice.id, format: :json
    
    assert_equal "the dude", json_response["first_name"]
  end

   test "#merchant" do
  	merchant = Merchant.create(name: "the dude")
  	invoice = invoices(:two)
    invoice.update_attributes(merchant_id: merchant.id)
    get :merchant, id: invoice.id, format: :json
    
    assert_equal "the dude", json_response["name"]
  end
end
