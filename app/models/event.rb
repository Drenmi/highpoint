class Event < ActiveRecord::Base
  has_many :donations, inverse_of: :event

  validates :start_on, presence: true
  validates :end_on, presence: true
  validates :name, presence: true
end
