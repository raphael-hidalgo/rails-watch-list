# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts "Cleaning Movies"
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Fake it until you make it"
# list = List.new(name: "all movies")
# list.save
# movie1 = Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# bookmark1 = Bookmark.create!(comment:"abcdef", list_id: list.id, movie_id: movie1.id)
# movie2 = Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# bookmark2 = Bookmark.create!(comment:"abcdef", list_id: list.id, movie_id: movie2.id)
# movie3 = Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# bookmark3 = Bookmark.create!(comment:"abcdef", list_id: list.id, movie_id: movie3.id)
# movie4 = Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
# bookmark4 = Bookmark.create!(comment:"abcdef", list_id: list.id, movie_id: movie4.id)
# Movie.create!(title: "TEST", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
list = List.create(name: "All movies")
list_1 = List.create!(name: "Drama")
list_2 = List.create!(name: "Action")
list_3 = List.create!(name: "Animation")
list_4 = List.create!(name: "Documentary")
list_5 = List.create!(name: "Comedy")
lists = [list_1, list_2, list_3, list_4, list_5]
url = "http://tmdb.lewagon.com/movie/top_rated"
titles = []
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    unless titles.include?(movie['title'])
      titles << movie['title']
      puts "Creating #{movie['title']}"
      base_poster_url = "https://image.tmdb.org/t/p/original"
      movie_ = Movie.create!(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
        rating: movie['vote_average']
      )
      Bookmark.create!(comment:"abcdef", list_id: lists.sample.id, movie_id: movie_.id)
      Bookmark.create!(comment:"abcdef", list_id: list.id, movie_id: movie_.id)
    end
  end
end
puts "Movies created"

puts "You did it"
