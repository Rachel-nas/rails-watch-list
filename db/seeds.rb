# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all

require "json"
require "rest-client"

10.times do |id|
  file = RestClient.get "http://tmdb.lewagon.com/movie/top_rated?page=#{id + 1}"
  repos = JSON.parse(file)
  repos["results"].each do |movie_hash|
    next if Movie.find_by(title: movie_hash["title"])
    movie = Movie.new(
      overview: movie_hash["overview"],
      poster_url: "https://image.tmdb.org/t/p/w500#{movie_hash["poster_path"]}",
      rating: movie_hash["vote_average"].to_f,
      title: movie_hash["title"]
    )
    movie.save!
    puts "#{movie.title} created"
  end
end
