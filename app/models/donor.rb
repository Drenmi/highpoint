class Donor < ActiveRecord::Base
  has_many :donations, inverse_of: :donor

  validates :identification, presence: true, uniqueness: true

  scope :search, -> (keyword) { where("name ILIKE ?", "%#{keyword}%") }

  def total_donations
    donations.sum(:amount).round
  end
end
