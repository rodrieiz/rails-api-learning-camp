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
class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :topic_id, :latitude, :longitude, presence: true
end
