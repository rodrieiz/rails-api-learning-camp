class Topic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
end
