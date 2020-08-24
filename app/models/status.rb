class Status < ApplicationRecord
  validates :type, inclusion: { in: %w(done in_progress finished),
    message: "%{value} is not a valid size" }, allow_nil: false
end
