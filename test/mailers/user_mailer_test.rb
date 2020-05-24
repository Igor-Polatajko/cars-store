require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_confirmation_token" do
    mail = UserMailer.send_confirmation_token
    assert_equal "Send confirmation token", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
