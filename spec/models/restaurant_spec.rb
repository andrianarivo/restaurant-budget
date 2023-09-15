require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject do
    FactoryBot.create(:restaurant)
  end

  before { subject.save }

  it 'is a valid restaurant' do
    expect(subject).to be_valid
  end

  it 'has a name' do
    subject.name = ''
    expect(subject).not_to be_valid
  end

  it 'has a user associated' do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it 'associated user is valid' do
    expect(subject.user).to be_valid
  end

  it 'total_spec is correct' do
    expenses = FactoryBot.create_list :expense, 4
    subject.expenses << expenses
    expect { subject.save }.to(change { subject.total_expense })
  end
end
