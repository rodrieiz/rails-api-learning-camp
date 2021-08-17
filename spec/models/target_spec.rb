require 'rails_helper'

RSpec.describe Target, type: :model do
  subject { build(:target) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:radius) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_presence_of(:latitude) }
end
