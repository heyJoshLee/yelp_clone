class Review < ActiveRecord::Base

  belongs_to :business
  belongs_to :user

  validates :title, presence: true

  validates :rating, presence: true

  def self.recent_reviews(num=10)
    order("created_at DESC").limit(num)
  end

end