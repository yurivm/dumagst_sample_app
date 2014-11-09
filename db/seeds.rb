# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# load all the users
data_root = File.join(File.dirname(__FILE__), "ml-100k")
user_csv_file = File.join(data_root, "u.user")
movie_csv_file = File.join(data_root, "u.item")
rating_csv_file = File.join(data_root, "u.data")
# import users
User.delete_all
CSV.foreach(user_csv_file, col_sep: "|") do |row|
  User.create!(
    id: row[0],
    age: row[1],
    gender:  row[2],
    occupation: row[3],
    zip_code: row[4]
  )
end

# import movies
Movie.delete_all

CSV.foreach(movie_csv_file, col_sep: "|", encoding: Encoding::ISO_8859_1) do |row|
  released_at = row[2].nil? ? nil : DateTime.strptime(row[2],"%d-%b-%Y")
  Movie.create!(
    id: row[0],
    title: row[1],
    released_at: released_at,
    imdb_url: row[4]
  )
end

# import ratings

Rating.delete_all
CSV.foreach(rating_csv_file, col_sep: "\t") do |row|
  Rating.create!(
    user_id: row[0],
    movie_id: row[1],
    rating: row[2].to_i,
    rated_at: Time.at(row[3].to_i)
  )
end


