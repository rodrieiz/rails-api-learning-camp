# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject { build(:topic) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
