class Donor < ActiveRecord::Base
  has_many :donations, inverse_of: :donor

  validates :identification, presence: true, uniqueness: true

  scope :search, -> (keyword) { where("name ILIKE ?", "%#{keyword}%") }

  def total_donations(cause_id = nil)
    if cause_id.present?
      donations.where(cause_id: cause_id).sum(:amount).round
    else
      donations.sum(:amount).round
    end
  end
end
