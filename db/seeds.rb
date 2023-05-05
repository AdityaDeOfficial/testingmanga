# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
# db/seeds.rb
require 'open-uri'
require 'faker'

# Replace 1 with an existing user_id in your database
user_id = 1

10.times do |i|
  manga = Manga.create!(
    manga_title: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user_id: user_id
  )

  # Replace this URL with the URL of the cover image you want to use
  cover_image_url = 'https://avt.mkklcdnv6temp.com/30/e/13-1583488820.jpg'

  cover_image = URI.open(cover_image_url)

  manga.cover_image.attach(
    io: cover_image,
    filename: "manga_#{i + 1}_cover_image.jpg",
    content_type: 'image/jpg'
  )
end

puts '10 mangas with cover images have been created using Faker.'
