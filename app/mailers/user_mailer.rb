class UserMailer < ActionMailer::Base
  def welcome_email(user)
    @user = user
    @url  = sign_in_url
    mail(
      from: Clearance.configuration.mailer_sender,
      to: @user.email,
      subject: "You have been added to the HCSA Donations Management System"
    )
  end
end
