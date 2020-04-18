require 'test_helper'

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get error_show_url
    assert_response :success
  end

end
