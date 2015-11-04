require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#show" do
  	item = items(:two)
    get :show, id: item.id, format: :json
    
    assert_equal "this is an item", json_response["name"]
  end
end
