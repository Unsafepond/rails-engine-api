require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#show" do
  	item = items(:two)
    get :show, id: item.id, format: :json
    
    assert_equal "this is an item", json_response["name"]
  end

  test "#invoice_items" do
  	item = items(:two)
    invoice_item = InvoiceItem.create(unit_price: 1337, item_id: item.id)

    get :invoice_items, id: item.id, format: :json
    
    assert_equal 1337, json_response.first["unit_price"]
  end
end
