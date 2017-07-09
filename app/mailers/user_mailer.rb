class UserMailer < ActionMailer::Base
  default from: 'cropper@example.com'
  layout 'mailer'

  def event_notification(user, event)
    @user = user
    @event = event

    mail(to: @user.email, subject: 'New event created')
  end
end
