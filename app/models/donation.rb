class Donation < ActiveRecord::Base
  self.per_page = 15

  belongs_to :donor, inverse_of: :donations
  belongs_to :cause, inverse_of: :donations
  belongs_to :event, inverse_of: :donations

  validates :donor, presence: true
  validates_associated :donor
  validates :amount, presence: true, numericality: { greater_than: 0 }

  scope :search, ->(keyword) { joins(:donor).where("name ILIKE ?", "%#{keyword}%") }

  scope :donations_for_year, ->(year) { where("EXTRACT(YEAR FROM donations.created_at) = ?", year) }

  scope :donations_for_month, ->(year, month) { where("EXTRACT(YEAR FROM donations.created_at) = ? AND EXTRACT(MONTH FROM donations.created_at) = ?", year, month) }
end
