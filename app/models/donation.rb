class Donation < ActiveRecord::Base

  validates_presence_of :amount
  validate :amount_must_be_greater_than_zero

  def amount_must_be_greater_than_zero
    if amount <= 0
      errors.add(:amount, 'must be greater than zero')
    end
  end

end
