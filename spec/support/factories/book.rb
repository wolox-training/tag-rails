# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::LoremPixel.image }
    title { Faker::Book.title.truncate 25 }
    editor { Faker::Name.name }
    year { Faker::Number.within(range: 0..2019) }
  end
end
