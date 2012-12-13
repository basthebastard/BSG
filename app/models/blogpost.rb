class Blogpost < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, :presence => true
  validates :content, :presence => true

  def to_param
  	"#{id} #{title}".parameterize
  end

#  def to_param
#    title
#  end
end