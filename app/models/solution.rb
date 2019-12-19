class Solution < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id
  belongs_to :vf_case, foreign_key: :vf_case_id
  default_scope { order(created_at: :desc) }
end
