class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :users_who_rated, through: :ratings, source: :user
end
