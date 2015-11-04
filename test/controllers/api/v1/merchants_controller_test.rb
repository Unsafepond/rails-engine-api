require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#show" do
  	merchant = merchants(:two)
    get :show, id: merchant.id, format: :json
    
    assert_equal "dude", json_response["name"]
  end

  test "#items" do
  	merchant = merchants(:two)
    Item.create(name: "test", merchant_id: merchant.id)
    Item.create(name: "test2", merchant_id: merchant.id)
    get :items, id: merchant.id, format: :json
    # binding.pry
    assert_equal "test", json_response.first["name"]
    assert_equal "test2", json_response[1]["name"]
  end

  test "#invoices" do
    merchant = merchants(:two)
    Invoice.create(status: "test", merchant_id: merchant.id)
    Invoice.create(status: "test2", merchant_id: merchant.id)
    get :invoices, id: merchant.id, format: :json
    # binding.pry
    assert_equal "test", json_response.first["status"]
    assert_equal "test2", json_response[1]["status"]
  end
end
