require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { create(:user) }
  let!(:user2) { build(:user, email: user1.email) }
  let!(:user3) { build(:user, gender: 'GenderTest') }

  it 'valid user' do
    expect(user1).to be_valid
  end

  it 'invalid user attributes, duplicate email' do
    expect(user2).to_not be_valid
  end

  it 'invalid user attributes, incorrect gender' do
    expect(user3).to_not be_valid
  end
end
