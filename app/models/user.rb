class User < ActiveRecord::Base

  has_secure_password

  has_many :purchases

  validates_presence_of :email, :password, :password_confirmation
  validates_uniqueness_of :email

end
