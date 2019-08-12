# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50000.times do
  Book.create({
    genre: Faker::Book.genre,
    author: Faker::Book.author,
    image: Faker::LoremPixel.image,
    title: Faker::Book.title.truncate(25),
    editor: Faker::Name.name,
    year: Faker::Number.within(range: 0..2019)
  })
end
