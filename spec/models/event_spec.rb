require "rails_helper"

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:start_on) }
  it { is_expected.to validate_presence_of(:end_on) }
  it { is_expected.to validate_presence_of(:name) }
end
