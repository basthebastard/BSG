class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to '/contact-success'
    else
#      flash[:notice]= "Please fill in all required(*) fields."
#      redirect_to '/contact'
    render action: "new" 
    end
  end

end