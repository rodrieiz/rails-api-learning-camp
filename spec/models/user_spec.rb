require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do 
    @user1 = create(:user)
  end

  it 'valid user' do
    expect(@user1).to be_valid
  end

  it 'invalid user attributes, duplicate email' do
    @user2 = build(:user, email: @user1.email)
    expect(@user2).to_not be_valid
  end

  it 'invalid user attributes, incorrect gender' do
    @user3 = build(:user, gender: 'GenderTest')
    expect(@user3).to_not be_valid
  end
end
