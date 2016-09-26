require "rails_helper"

RSpec.describe Donor, type: :model do
  it { is_expected.to have_many(:donations).inverse_of(:donor) }

  it { is_expected.to validate_presence_of(:identification) }
end
