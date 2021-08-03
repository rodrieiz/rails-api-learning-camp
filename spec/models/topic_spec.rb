require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject { build(:topic) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
