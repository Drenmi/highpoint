require "rails_helper"

RSpec.describe Donation, type: :model do
  it { is_expected.to belong_to(:donor).inverse_of(:donations) }
  it { is_expected.to belong_to(:cause).inverse_of(:donations) }

  it { is_expected.to validate_presence_of(:donor) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
end
