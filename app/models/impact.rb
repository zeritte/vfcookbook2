class Impact < ApplicationRecord
  has_many :cases
  validates :name, length: { minimum: 3 }
end
