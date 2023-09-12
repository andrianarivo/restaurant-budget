FactoryBot.define do

  factory :user do
    name { "david" }
    email { Faker::Internet.unique.email }
    password { "password"}
    password_confirmation { "password" }
    confirmed_at { Date.today }
  end

  factory :restaurant do
    name { Faker::Name.unique.name }
    icon { "culloch" }
    user
  end

end