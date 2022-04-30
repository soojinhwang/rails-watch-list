# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { na  me: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Cleaning database..."
# Movie.destroy_all

# puts "Creating restaurants..."

# wonder_woman = { title: 'Wonder Woman 1984',
#                  overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s',
#                  poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
#                  rating: 6.9 }
# shawshank_redemption = { title: 'The Shawshank Redemption',
#                          overview: 'Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison',
#                          poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
#                          rating: 8.7 }
# titanic = { title: 'Titanic',
#             overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic',
#             poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg',
#             rating: 7.9 }
# oceans_eight = { title: "Ocean's Eight",
#                  overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century',
#                  poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg',
#                  rating: 7.0 }

# [wonder_woman, shawshank_redemption, titanic, oceans_eight].each do |attributes|
#   movie = Movie.create!(attributes)
#   puts "Created #{movie.title}"
# end
# puts "Finished!"

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating movies...'

movies_serialized = URI.open('https://tmdb.lewagon.com/movie/top_rated').read
json = JSON.parse(movies_serialized)

json['results'].each do |entry|
  movie = Movie.create!(
    title: entry['title'],
    overview: entry['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{entry['poster_path']}",
    rating: entry['vote_average']
  )
  puts "Created #{movie.title}"
end

puts 'Finished!'
