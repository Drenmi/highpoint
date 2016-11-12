class Donor < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  has_many :donations, inverse_of: :donor

  validates :identification, presence: true, uniqueness: true

  scope :search, ->(keyword) { where("name ILIKE :keyword OR identification ILIKE :keyword", keyword: "%#{keyword}%") }

  def total_donations(cause_id = nil)
    if cause_id.present?
      donations.where(cause_id: cause_id).sum(:amount).round
    else
      donations.sum(:amount).round
    end
  end
end
