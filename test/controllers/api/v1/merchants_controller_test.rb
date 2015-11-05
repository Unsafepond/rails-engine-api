require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, id: merchant.id, format: :json
    
    assert_equal "dude", json_response["name"]
  end

  test "#find" do
    get :find, id: merchant.id, format: :json
    
    assert_equal "dude", json_response["name"]
  end

  test "#find_all" do
    Merchant.create(name: "dude")
    Merchant.create(name: "dude")

    get :find_all, name: merchant.name, format: :json
    
    assert_equal 3, json_response.count
  end

  test "#items" do
    Item.create(name: "test", merchant_id: merchant.id)
    Item.create(name: "test2", merchant_id: merchant.id)
    get :items, id: merchant.id, format: :json
    # binding.pry
    assert_equal "test", json_response.first["name"]
    assert_equal "test2", json_response[1]["name"]
  end

  test "#invoices" do
    Invoice.create(status: "test", merchant_id: merchant.id)
    Invoice.create(status: "test2", merchant_id: merchant.id)
    get :invoices, id: merchant.id, format: :json
    # binding.pry
    assert_equal "test", json_response.first["status"]
    assert_equal "test2", json_response[1]["status"]
  end

  test "#revenue" do
    invoice1 = Invoice.create(status: "shipped", merchant_id: merchant.id)
    invoice2 = Invoice.create(status: "shipped", merchant_id: merchant.id)
    InvoiceItem.create(quantity: 2, unit_price: 1500, invoice_id: invoice1.id)
    InvoiceItem.create(quantity: 1, unit_price: 1000, invoice_id: invoice2.id)

    get :revenue, id: merchant.id, format: :json

    assert_equal 40.00, json_response["revenue"]
  end

  test "#revenue by date" do
    time = Time.now
    invoice1 = Invoice.create(status: "shipped", merchant_id: merchant.id, created_at: time)
    invoice2 = Invoice.create(status: "shipped", merchant_id: merchant.id, created_at: time)
    invoice3 = Invoice.create(status: "shipped", merchant_id: merchant.id, created_at: (Time.now - 10))
    InvoiceItem.create(quantity: 2, unit_price: 1500, invoice_id: invoice1.id)
    InvoiceItem.create(quantity: 1, unit_price: 1000, invoice_id: invoice2.id)
    InvoiceItem.create(quantity: 1, unit_price: 1000, invoice_id: invoice3.id)

    get :revenue, id: merchant.id, date: time, format: :json

    assert_equal 40.00, json_response["revenue"]
  end

  test "#favorite_customer" do
    customer1 = customers(:one)
    customer2 = customers(:two)
    invoice1 = Invoice.create(status: "shipped", merchant_id: merchant.id, customer_id: customer1.id)
    invoice2 = Invoice.create(status: "shipped", merchant_id: merchant.id, customer_id: customer1.id)
    invoice3 = Invoice.create(status: "shipped", merchant_id: merchant.id, customer_id: customer2.id)
    invoice4 = Invoice.create(status: nil, merchant_id: merchant.id, customer_id: customer2.id)

    get :favorite_customer, id: merchant.id, format: :json
    
    assert_equal "stuff", json_response["first_name"]
  end

  test "#customers_with_pending_invoices" do
    customer1 = customers(:one)
    customer2 = customers(:two)
    invoice1 = Invoice.create(status: "shipped", merchant_id: merchant.id, customer_id: customer1.id)
    invoice2 = Invoice.create(status: "pending", merchant_id: merchant.id, customer_id: customer1.id)
    invoice3 = Invoice.create(status: "pending", merchant_id: merchant.id, customer_id: customer2.id)
    t1 = Transaction.create(result: "success", invoice_id: invoice1.id)
    t2 = Transaction.create(result: "pending", invoice_id: invoice2.id)
    t3 = Transaction.create(result: "pending", invoice_id: invoice3.id)

    get :customers_with_pending_invoices, id: merchant.id, format: :json
    
    assert_equal "stuff", json_response.first["first_name"]
  end

  test "#most_revenue" do
    merchant2 = merchants(:one)
    merchant3 = merchants(:three)
    invoice1 = Invoice.create(status: "shipped", merchant_id: merchant.id)
    invoice2 = Invoice.create(status: "shipped", merchant_id: merchant3.id)
    InvoiceItem.create(quantity: 2, unit_price: 1500, invoice_id: invoice1.id)
    InvoiceItem.create(quantity: 1, unit_price: 1000, invoice_id: invoice2.id)

    get :most_revenue, quantity: 2, format: :json
    
    assert_equal "dude", json_response.first["name"]
    assert_equal "bleh", json_response.last["name"]
  end

  private

    def merchant
      merchants(:two)
    end

end
