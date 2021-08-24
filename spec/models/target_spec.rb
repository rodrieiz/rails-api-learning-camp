# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  topic_id   :bigint           not null
#  title      :string
#  radius     :decimal(, )
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Target, type: :model do
  subject { build(:target) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:radius) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_presence_of(:latitude) }
end
