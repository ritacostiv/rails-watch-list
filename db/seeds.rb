# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Bookmark.destroy_all  # Must destroy bookmarks first due to foreign key constraints
List.destroy_all
Movie.destroy_all

puts "Creating movies..."
movie1 = Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
puts "Created #{movie1.title}"
movie2 = Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
puts "Created #{movie2.title}"
movie3 = Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
puts "Created #{movie3.title}"
movie4 = Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
puts "Created #{movie4.title}"

puts "Creating lists..."
list1 = List.create(name: "Action Movies")
puts "Created #{list1.name}"
list2 = List.create(name: "Drama Classics")
puts "Created #{list2.name}"
list3 = List.create(name: "Girls Night")
puts "Created #{list3.name}"

puts "Creating bookmarks..."
# Action Movies list
bookmark1 = Bookmark.create(movie: movie1, list: list1, comment: "Amazing superhero film with great action sequences")
puts "Added #{bookmark1.movie.title} to #{bookmark1.list.name}"

# Drama Classics list
bookmark2 = Bookmark.create(movie: movie2, list: list2, comment: "One of the greatest films ever made")
puts "Added #{bookmark2.movie.title} to #{bookmark2.list.name}"
bookmark3 = Bookmark.create(movie: movie3, list: list2, comment: "Classic romance and disaster film")
puts "Added #{bookmark3.movie.title} to #{bookmark3.list.name}"

# Girls Night list
bookmark4 = Bookmark.create(movie: movie4, list: list3, comment: "Fun heist movie with an all-female cast")
puts "Added #{bookmark4.movie.title} to #{bookmark4.list.name}"
bookmark5 = Bookmark.create(movie: movie3, list: list3, comment: "Romantic and emotional")
puts "Added #{bookmark5.movie.title} to #{bookmark5.list.name}"

puts "Seeding completed!"
