class Business < ActiveRecord::Base

  has_many :reviews

  validates :name, presence: true, length: {minimum: 4, maximum: 80}
  validates_uniqueness_of :name, case_sensitive: false

  validates :url, presence: true


  validates :description, presence: true, length: {minimum: 10, maximum: 500 }

  belongs_to :category

  def rating
    reviews.count > 0 ? reviews.map(&:rating).reduce(:+) / reviews.count : 0
  end

end