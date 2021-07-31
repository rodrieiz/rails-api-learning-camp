class Topic < ApplicationRecord
  # Validate params
  validates :name, presence: true, uniqueness: true 
end
