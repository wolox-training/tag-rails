FactoryBot.define do
  factory :book do
    genre {Faker::Book.genre}
    author {Faker::Book.author}
    image {Faker::LoremPixel.image}
    title {Faker::Book.title}
    editor {Faker::Name.name}
    year {Faker::Number.within(0..2019)}
  end
end