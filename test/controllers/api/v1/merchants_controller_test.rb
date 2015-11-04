require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#show" do
  	merchant = merchants(:two)
    get :show, id: merchant.id, format: :json
    
    assert_equal "dude", json_response["name"]
  end

  test "#items" do
  	merchant = merchants(:two)
    get :items, id: merchant.id, format: :json
    
    assert_equal 1400, json_response["unit_price"]
  end
end
