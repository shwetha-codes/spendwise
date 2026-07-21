class MonthlySalary < ApplicationRecord
  belongs_to :user

  validates :month, presence: true
  validates :amount,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  validates :month,
            uniqueness: { scope: :user_id }
end
