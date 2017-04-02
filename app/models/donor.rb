class Donor < ActiveRecord::Base
  has_paper_trail

  self.per_page = 15

  before_create :set_name

  default_scope { order(created_at: :desc) }

  has_many :donations, inverse_of: :donor

  validates :identification, uniqueness: true

  scope :search, ->(keyword) { where("name ILIKE :keyword OR identification ILIKE :keyword", keyword: "%#{keyword}%") }

  scope :same_postcode, ->(postcode) { where(postal_code: postcode) }

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

  def anonymous?
    self.name == "Anonymous"
  end

  def shares_postal_code_with_others?
    self.postal_code&.present? && Donor.same_postcode(self.postal_code).count > 1
  end

  def donors_own_postal_code(donor)
    donor.name == self.name
  end
end
