FactoryBot.define do
  factory :link, class: Link do
    name { Faker::Internet.url }
    description { Faker::Lorem.sentence }
    tags { Faker::Lorem.words(4) }
  end
end
