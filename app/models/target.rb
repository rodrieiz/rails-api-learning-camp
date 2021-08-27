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

  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  validates :title, :radius, :topic_id, :latitude, :longitude, presence: true
end
