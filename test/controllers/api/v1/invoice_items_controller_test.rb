require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#show" do
  	ii = invoice_items(:two)
    get :show, id: ii.id, format: :json
    
    assert_equal 1400, json_response["unit_price"]
  end
end
