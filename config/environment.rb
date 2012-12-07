# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BSG::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "www.bearshotgun.com",
  :user_name            => "basthebastard@bearshotgun.com",
  :password             => "sigabi86",
  :authentication       => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options = {
  :host => "www.bearshotgun.com"
}