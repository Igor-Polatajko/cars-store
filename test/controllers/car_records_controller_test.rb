require 'test_helper'

class CarRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_record = car_records(:one)
  end

  test "should get index" do
    get car_records_url
    assert_response :success
  end

  test "should get new" do
    get new_car_record_url
    assert_response :success
  end

  test "should create car_record" do
    assert_difference('CarRecord.count') do
      post car_records_url, params: { car_record: { description: @car_record.description, price: @car_record.price, title: @car_record.title } }
    end

    assert_redirected_to car_record_url(CarRecord.last)
  end

  test "should show car_record" do
    get car_record_url(@car_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_record_url(@car_record)
    assert_response :success
  end

  test "should update car_record" do
    patch car_record_url(@car_record), params: { car_record: { description: @car_record.description, price: @car_record.price, title: @car_record.title } }
    assert_redirected_to car_record_url(@car_record)
  end

  test "should destroy car_record" do
    assert_difference('CarRecord.count', -1) do
      delete car_record_url(@car_record)
    end

    assert_redirected_to car_records_url
  end
end
