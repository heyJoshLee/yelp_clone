class Business < ActiveRecord::Base


  validates :name, presence: true, length: {minimum: 4, maximum: 80}
  validates_uniqueness_of :name, case_sensitive: false

  validates :description, presence: true, length: {minimum: 10, maximum: 500 }

  belongs_to :category

end