# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Movie.destroy_all

movies_url = "https://tmdb.lewagon.com/movie/top_rated"

post_ids = JSON.parse(RestClient.get(movies_url))

post_ids['results'].each do |result|
  movie = Movie.new(
    title: result["title"],
    overview: result["overview"],
    poster_url: result["poster_path"],
    rating: result["vote_average"]
  )
  movie.save

end
