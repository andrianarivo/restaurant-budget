FactoryBot.define do

  factory :user, aliases: [ :author ] do
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

  factory :expense do
    name { Faker::Name.first_name }
    amount { 10.05 }
    author

    trait :with_restaurant do
      after(:create) do |expense|
        expense.restaurants << create(:restaurant)
      end
    end

    factory :expense_with_restaurant, traits: [:with_restaurant]
  end

end