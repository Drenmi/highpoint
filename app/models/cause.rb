class Cause < ActiveRecord::Base
  has_many :donations, inverse_of: :cause

  validates :shortcode, presence: true
  validates :name, presence: true, uniqueness: true
end
