class Review < ActiveRecord::Base

  belongs_to :business
  belongs_to :user

  validates :title, presence: true

  validates :rating, presence: true
end