class User < ActiveRecord::Base
  attr_accessible :email

  validates :email, :presence => true, :email => true
end
