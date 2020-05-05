require 'test_helper'

class OrderRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_request_new_url
    assert_response :success
  end

end
