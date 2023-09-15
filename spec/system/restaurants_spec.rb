require 'rails_helper'

RSpec.describe 'Restaurants', type: :system do
  before(:all) { @restaurant = FactoryBot.create(:restaurant) }
  before(:each) { sign_in @restaurant.user }

  it 'I can see restaurants name' do
    visit restaurants_path
    expect(page).to have_content(@restaurant.name)
  end

  it 'I can add new restaurant' do
    visit restaurants_path

    click_link 'New restaurant'
    fill_in 'restaurant[name]', with: Faker::Restaurant.name
    attach_file 'restaurant[icon]', "#{Rails.root}/spec/fixtures/McDonalds-Logo.png"
    click_button 'Create Restaurant'

    expect(page).to have_content('Restaurant was successfully created.')
  end
end
