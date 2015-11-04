require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#show" do
  	dude = customers(:two)
    get :show, id: dude.id, format: :json
    # binding.pry
    assert_equal "things2", json_response["last_name"]
  end
end
