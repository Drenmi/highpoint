class Donor < ActiveRecord::Base
  has_many :donations, inverse_of: :donor

  validates :identification, presence: true
end
