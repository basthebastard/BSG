class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :firstname,:lastname, :email, :company, :phone, :body

  validates_presence_of :firstname, :message => "Please enter your first name"
  validates_presence_of :lastname, :message => "Please enter your last name"
  validates_presence_of :email, :message => "Please enter your email address"
  validates_presence_of :body, :message => "You didn't leave a message"
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :message => "The e-mail address you entered is invalid" }, :allow_blank => true 

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end