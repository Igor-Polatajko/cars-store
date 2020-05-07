require 'test_helper'

class OrderRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_request_path
    assert_response :success
  end

end
