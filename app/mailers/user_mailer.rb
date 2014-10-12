class UserMailer < ActionMailer::Base
  default from: "MedTracker2@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/new'
    mail(to: @user.email, subject: 'Welcome to MedTracker 2.0')
  end
end
