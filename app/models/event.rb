class Event < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  has_many :donations, inverse_of: :event

  validates :start_on, presence: true
  validates :end_on, presence: true
  validates :name, presence: true

  scope :search, -> (keyword) { where("name ILIKE ?", "%#{keyword}%") }
end
