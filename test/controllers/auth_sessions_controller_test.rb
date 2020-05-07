require 'test_helper'

class AuthSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get auth_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get auth_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get auth_sessions_destroy_url
    assert_response :success
  end

end
