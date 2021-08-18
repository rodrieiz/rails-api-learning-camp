class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :topic_id, :latitude, :longitude, presence: true
end
