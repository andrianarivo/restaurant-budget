require 'rails_helper'

RSpec.describe "Expenses", type: :system do

  before(:all) { @expense = FactoryBot.create(:expense_with_restaurant) }
  before(:each) { sign_in @expense.author }

  it 'I can see expenses name' do
    visit restaurant_path(@expense.restaurants.first)
    expect(page).to have_content(@expense.name)
  end
end
