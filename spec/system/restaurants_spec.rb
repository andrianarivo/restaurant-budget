require 'rails_helper'

RSpec.describe "Restaurants", type: :system do

  before(:all) { @restaurant = FactoryBot.create(:restaurant) }
  before(:each) { sign_in @restaurant.user }

  it 'I can see restaurants name' do
    visit restaurants_path
    expect(page).to have_content(@restaurant.name)
  end
end
