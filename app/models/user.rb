class User < ActiveRecord::Base

  has_many :reviews

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  validates :username, presence: true
  validates_uniqueness_of :username, case_sensitive: false

  validates :password, presence: true

  has_secure_password validations: false

  def has_reviewed?(business)
    reviews.map(&:business_id).include?(business.id)
  end

end