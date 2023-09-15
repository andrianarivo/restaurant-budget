require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  before { subject.save }

  it 'is a valid user' do
    expect(subject).to be_valid
  end

  it 'has a name' do
    subject.name = ''
    expect(subject).not_to be_valid
  end
end
