class User < ActiveRecord::Base

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  validates :password, presence: true

  has_secure_password validations: false

end