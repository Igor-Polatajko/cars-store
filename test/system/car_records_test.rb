require "application_system_test_case"

class CarRecordsTest < ApplicationSystemTestCase
  setup do
    @car_record = car_records(:one)
  end

  test "visiting the index" do
    visit car_records_url
    assert_selector "h1", text: "Car Records"
  end

  test "creating a Car record" do
    visit car_records_url
    click_on "New Car Record"

    fill_in "Description", with: @car_record.description
    fill_in "Price", with: @car_record.price
    fill_in "Title", with: @car_record.title
    click_on "Create Car record"

    assert_text "Car record was successfully created"
    click_on "Back"
  end

  test "updating a Car record" do
    visit car_records_url
    click_on "Edit", match: :first

    fill_in "Description", with: @car_record.description
    fill_in "Price", with: @car_record.price
    fill_in "Title", with: @car_record.title
    click_on "Update Car record"

    assert_text "Car record was successfully updated"
    click_on "Back"
  end

  test "destroying a Car record" do
    visit car_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car record was successfully destroyed"
  end
end
