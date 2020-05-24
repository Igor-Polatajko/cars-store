class UserMailer < ApplicationMailer

  def send_confirmation_token(user)
    @user = user
    mail to: user.email, subject: 'Account confirmation'
  end
end
