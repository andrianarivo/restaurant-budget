require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    author = User.first
    author ||= User.create(name: 'David')
    Expense.new(name: 'Birthday!!', amount: 12.04, author:)
  end

  before { subject.save }

  it 'is a valid expense' do
    expect(subject).to be_valid
  end

  it 'has a name' do
    subject.name = ''
    expect(subject).not_to be_valid
  end

  it 'has a valid amount' do
    subject.amount = nil
    expect(subject).not_to be_valid
  end

  it 'has an author associated' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'associated author is valid' do
    expect(subject.author).to be_valid
  end
end
