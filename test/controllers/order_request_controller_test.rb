require 'test_helper'

class OrderRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_order_request_path(:id => 1)
    assert_response :success
  end

end
