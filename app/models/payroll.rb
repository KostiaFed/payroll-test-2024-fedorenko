class Payroll < ApplicationRecord
  scope :ordered, -> { order(starts_at: :desc) }
end
