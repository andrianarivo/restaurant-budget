require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject do
    @user = User.first
    @user ||= User.create(name: 'David')
    Restaurant.new(name: 'McDonald', user: @user)
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
    expenses = [
      Expense.create(name: 'exp1', amount: 1, author: @user),
      Expense.create(name: 'exp2', amount: 2, author: @user),
      Expense.create(name: 'exp3', amount: 3, author: @user),
      Expense.create(name: 'exp4', amount: 4, author: @user)
    ]
    subject.expenses << expenses
    expect { subject.save }.to(change { subject.total_expense })
  end
end
