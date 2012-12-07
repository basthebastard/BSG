class NotificationsMailer < ActionMailer::Base

  default :from => "basthebastard@bearshotgun.com"
  default :to => "basthebastard@bearshotgun.com"

  def new_message(message)
    @message = message
    mail(:subject => "Contact Us message from #{message.firstname} #{message.lastname}")
  end

end