class Nurse < ActiveRecord::Base
  has_secure_password
  has_many :patient

  validates_presence_of :username
  validates_presence_of :password

end
