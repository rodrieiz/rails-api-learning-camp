class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :radius, :latitude, :longitude, presence: true
end
