require 'rails_helper'

RSpec.describe "Restaurants", type: :request do

  before(:all) { @restaurant = FactoryBot.create(:restaurant) }
  before(:each) { sign_in @restaurant.user }

  it "GET /restaurants" do
    get restaurants_path
    expect(response).to have_http_status(:success)
  end

  it "GET /restaurants/:id" do
    get restaurant_path(@restaurant)
    expect(response).to have_http_status(:success)
  end

end
