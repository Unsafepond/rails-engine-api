require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#show" do
  	transaction = transactions(:two)
    get :show, id: transaction.id, format: :json
    
    assert_equal "success", json_response["result"]
  end
end
