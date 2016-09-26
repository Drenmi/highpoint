class Donation < ActiveRecord::Base
  belongs_to :donor, inverse_of: :donations
  belongs_to :cause, inverse_of: :donations

  validates :donor, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
