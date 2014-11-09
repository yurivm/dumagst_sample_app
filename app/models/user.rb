class User < ActiveRecord::Base
  has_many :ratings
  has_many :rated_movies, through: :ratings, source: :movie

end
