class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  scope :by_rating_desc, -> { order(rating: :desc)}
end
