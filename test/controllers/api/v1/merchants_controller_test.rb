require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, id: merchant.id, format: :json
    
    assert_equal "dude", json_response["name"]
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

  private

    def merchant
      merchants(:two)
    end

end
