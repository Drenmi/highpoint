class Donor < ActiveRecord::Base
  has_paper_trail

  self.per_page = 15

  before_create :set_name

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

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << column_names
      all.find_each do |donor|
        csv << donor.attributes.values_at(*column_names)
      end
    end
  end

  def set_name
    self.name = "" if name.blank?
  end
end
