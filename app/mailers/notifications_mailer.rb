class NotificationsMailer < ActionMailer::Base #contact form mailer settings

  default :from => "basthebastard@bearshotgun.com"
  default :to => "basthebastard@bearshotgun.com"

  def new_message(message)
    @message = message
    mail(:subject => "Contact Us message from #{message.firstname} #{message.lastname}")
  end

end