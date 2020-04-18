require 'test_helper'

class CarRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @images = [fixture_file_upload('./files/test-image.jpg', 'image')]
    @car_record_one = car_records(:one)
    @car_record_two = car_records(:two)
    @car_record_one.images = @images
    @car_record_two.images = @images

    @car_record_one.save
    @car_record_two.save
  end

  test "should get index" do
    get car_records_url

    assert_select ".car-record-container", 2

    assert_response :success
  end

  test "should get new" do
    get new_car_record_url

    assert_select "h1", "New Car Record"
    assert_select "form"

    assert_response :success
  end

  test "should create car_record" do
    assert_difference(['CarRecord.count', 'ActiveStorage::Attachment.count']) do
      post car_records_url, params: { car_record: { 
        description: @car_record_one.description,
        price: @car_record_one.price, 
        title: @car_record_one.title, 
        images: @images
       } 
     }
    end

    assert_redirected_to car_record_url(CarRecord.last)
  end

  test "should show car_record" do
    get car_record_url(@car_record_one)
    assert_select ".car_title", "CarOne"
    assert_select ".car_price", /\$[,\d]+/
    assert_select ".carousel-item"
    assert_response :success
  end

  test "should get edit" do
    get edit_car_record_url(@car_record_one)

    assert_select "h1", "Editing Car Record"
    assert_select "form"

    assert_response :success
  end

  test "should update car_record" do
    patch car_record_url(@car_record_one), params: { car_record: { 
         description: @car_record_one.description,
         price: @car_record_one.price, 
         title: @car_record_one.title, 
         images: @images
        } 
      }
    assert_redirected_to car_record_url(@car_record_one)
  end

  test "should destroy car_record" do
    assert_difference('CarRecord.count', -1) do
      delete car_record_url(@car_record_one)
    end

    assert_redirected_to car_records_url
  end
end