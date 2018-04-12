FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password { Faker::Internet.password }
  end
end
