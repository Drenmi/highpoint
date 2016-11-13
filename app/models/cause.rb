class Cause < ActiveRecord::Base
  has_many :donations, inverse_of: :cause
  has_many :donors, -> { unscope(:order).uniq }, through: :donations

  validates :shortcode, presence: true
  validates :name, presence: true, uniqueness: true

  def top_donation_for_year(year = Date.current.year)
    donations.where("EXTRACT(YEAR from donations.created_at) = ?", year).order("amount DESC").first
  end
end
