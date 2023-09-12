require 'rails_helper'

RSpec.describe "Expenses", type: :request do

  before(:all) { @expense = FactoryBot.create(:expense) }
  before(:each) { sign_in @expense.author }

  it "GET /expenses" do
    get expenses_path
    expect(response).to have_http_status(:success)
  end

  it "GET /expenses/:id" do
    get expense_path(@expense)
    expect(response).to have_http_status(:success)
  end
end
