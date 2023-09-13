require 'rails_helper'

RSpec.describe "Expenses", type: :system do

  before(:all) { @expense = FactoryBot.create(:expense_with_restaurant) }
  before(:each) { sign_in @expense.author }

  it 'I can see expenses name' do
    visit restaurant_path(@expense.restaurants.first)
    expect(page).to have_content(@expense.name)
  end

  it 'I can add a new expense' do
    visit restaurant_path(@expense.restaurants.first)

    click_link 'Add a new expense'
    fill_in 'Name', with: Faker::Food.dish
    fill_in 'Amount', with: 12.05
    select(@expense.restaurants.first.name, from: 'Restaurants')
    click_button 'Create Expense'

    expect(page).to have_content("Expense was successfully created.")
  end
end
