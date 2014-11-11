class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  scope :by_rating_desc, -> { order(rating: :desc)}
  scope :likes, -> { where("rating >= ?", Dumagst.configuration.minimal_rating_for_like )}
end
