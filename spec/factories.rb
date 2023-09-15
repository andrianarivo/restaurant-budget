FactoryBot.define do
  factory :user, aliases: [:author] do
    name { 'david' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Date.today }
  end

  factory :restaurant do
    name { Faker::Restaurant.unique.name }
    user
    after(:build) do |restaurant|
      restaurant.icon.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'McDonalds-Logo.png')),
        filename: 'McDonalds-Logo.png',
        content_type: 'image/png'
      )
    end
  end

  factory :expense do
    name { Faker::Food.dish }
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
