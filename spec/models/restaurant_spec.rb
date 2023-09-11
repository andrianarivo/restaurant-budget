require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject do
    user = User.first
    user ||= User.create(name: 'David')
    Restaurant.new(name: 'McDonald', user:)
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
end
