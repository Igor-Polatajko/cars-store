require 'test_helper'

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get error_path
    assert_response :success
  end

end
