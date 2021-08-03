require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:gender) }
  it { is_expected.to validate_uniqueness_of(:email).scoped_to(:provider).ignoring_case_sensitivity }
end
