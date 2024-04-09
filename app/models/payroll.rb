class Payroll < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :no_future, on: :create

  scope :ordered, -> { order(starts_at: :desc) }

  def self.generate_payroll
    PayrollCreator.new.generate
  end

  private

  def no_future
    errors.add(:ends_at, "You can't create payroll for future days") if ends_at > Date.today
  end
end
