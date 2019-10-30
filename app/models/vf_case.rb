class VfCase < ApplicationRecord
  belongs_to :domain
  belongs_to :impact
  belongs_to :tctype
  has_many :solutions, dependent: :restrict_with_error
end
