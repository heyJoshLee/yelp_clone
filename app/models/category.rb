class Category < ActiveRecord::Base

  has_many :businesses

  validates :name, presence: true, length: {minimum: 4, maximum: 20}
  validates_uniqueness_of :name, case_sensitive: false

end