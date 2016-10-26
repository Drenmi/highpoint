class Donation < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  belongs_to :donor, inverse_of: :donations
  belongs_to :cause, inverse_of: :donations
  belongs_to :event, inverse_of: :donations

  validates :donor, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  scope :search, -> (keyword) { joins(:donor).where("name ILIKE ?", "%#{keyword}%") }

  scope :donations_per_year, -> (year) { where("EXTRACT(YEAR FROM created_at) = ?", year) }
end
