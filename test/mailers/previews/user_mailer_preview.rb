
class UserMailerPreview < ActionMailer::Preview

  def send_confirmation_token
    UserMailer.send_confirmation_token
  end

end
