require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#show" do
  	invoice = invoices(:two)
    get :show, id: invoice.id, format: :json
    
    assert_equal "shipped", json_response["status"]
  end
end
