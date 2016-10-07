class Donor < ActiveRecord::Base
  has_many :donations, inverse_of: :donor

  validates :identification, presence: true

  def total_donations
    donations.sum(:amount).round
  end
end
