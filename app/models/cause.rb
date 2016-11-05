class Cause < ActiveRecord::Base
  has_many :donations, inverse_of: :cause
  has_many :donors, -> { unscope(:order).uniq }, through: :donations

  validates :shortcode, presence: true
  validates :name, presence: true, uniqueness: true
end
