require 'test_helper'

class MainPageControllerTest < ActionDispatch::IntegrationTest
  def setup
    images = [fixture_file_upload('./files/test-image.jpg', 'image')]
    @car_record_one = car_records(:one)
    @car_record_two = car_records(:two)
    @car_record_one.images = images
    @car_record_two.images = images
    @car_record_one.save
    @car_record_two.save
  end

  test "should get index" do
    get main_page_index_url
    assert_response :success
  end

end
