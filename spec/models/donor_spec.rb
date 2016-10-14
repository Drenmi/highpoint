require "rails_helper"

RSpec.describe Donor, type: :model do
  it { is_expected.to have_many(:donations).inverse_of(:donor) }

  it { is_expected.to validate_presence_of(:identification) }

  describe "#total_donations" do
    let(:donor) { create(:donor_with_donations) }

    it { expect(donor.total_donations).to eq(200) }
  end

  describe ".search" do
    let(:match_beginning) { create(:donor, name: "Smithie Black", identification: "G1234567M") }
    let(:match_middle) { create(:donor, name: "Bob Smith-White", identification: "G1234567M") }
    let(:match_end) { create(:donor, name: "John Smith", identification: "G1234567M") }
    let(:no_match) { create(:donor, name: "Carl Grey", identification: "G1234567M") }

    it { expect(described_class.search("smith")).to contain_exactly(match_beginning, match_middle, match_end) }
  end
end
