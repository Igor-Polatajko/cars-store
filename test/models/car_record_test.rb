require 'test_helper'

class CarRecordTest < ActiveSupport::TestCase

  test "record should be valid" do
    record = CarRecord.new(
      title: "My Car",
      description: "description",
      images: [fixture_file_upload('files/test-image.jpg', 'image')],
      price: 1,
      user: users(:one)
    )

    assert record.valid?
    end

  test "record attributes must not be empty" do
    record = CarRecord.new
    assert record.invalid?
    assert record.errors[:title].any?
    assert record.errors[:description].any?
    assert record.errors[:price].any?
    assert record.errors[:images].any?
    end

  test "record price must be positive" do
    record_with_negative_price = CarRecord.new(
      title: "My Car",
      description: "description",
      images: [fixture_file_upload('./files/test-image.jpg', 'image')],
      price: -1)

    assert record_with_negative_price.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    record_with_negative_price.errors[:price]

    record_with_zero_price = CarRecord.new(
      title: "My Car",
      description: "description",
      images: [fixture_file_upload('./files/test-image.jpg', 'image')],
      price: 0)
    assert record_with_zero_price.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    record_with_zero_price.errors[:price]
    end

    test "record images number must be 5 or less" do

      test_image = fixture_file_upload('./files/test-image.jpg', 'image')
      test_images = []
      6.times { test_images.push(test_image) }

      record = CarRecord.new(
        title: "My Car",
        description: "description",
        images: test_images,
        price: 15000)
  
      assert record.invalid?
      assert_equal ["maximum number of images is 5"],
      record.errors[:images]
      end
end
