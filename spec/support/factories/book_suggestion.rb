FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.paragraph }
    price { '$' << Faker::Number.decimal(l_digits: 2, r_digits: 2).to_s }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    editor { Faker::Book.publisher }
    year { Faker::Number.within(range: 0..2019) }
    user_id { nil }
  end
end
