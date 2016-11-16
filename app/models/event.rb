class Event < ActiveRecord::Base
  has_paper_trail

  has_many :donations, inverse_of: :event

  validates :start_on, presence: true
  validates :end_on, presence: true
  validates :name, presence: true
  validate :start_before_end

  def start_before_end
    if end_on && start_on
      errors.add(:base, "End Date cannot be before Start Date") if end_on < start_on
    end
  end

  scope :search, ->(keyword) { where("name ILIKE ?", "%#{keyword}%") }

  def total_donations(keyword = nil)
    donations.search(keyword).sum(:amount).round
  end
end
