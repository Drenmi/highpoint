require "rails_helper"

RSpec.describe Donor, type: :model do
  subject { build(:donor) }

  it { is_expected.to have_many(:donations).inverse_of(:donor) }

  it { is_expected.to validate_presence_of(:identification) }
  it { is_expected.to validate_uniqueness_of(:identification) }

  describe "#total_donations" do
    let(:donor) { create(:donor_with_donations) }

    it { expect(donor.total_donations).to eq(400) }
    it { expect(donor.total_donations(-1)).to eq(0) }
  end

  describe ".search" do
    before do
      @match_beginning = create(:donor, name: "Smithie Black")
      @match_middle = create(:donor, name: "Bob Smith-White")
      @match_end = create(:donor, name: "John Smith")
      @no_match = create(:donor, name: "Carl Grey")
      @match_identification = create(:donor, identification: "B777888A")
    end

    it { expect(described_class.search("smith")).to contain_exactly(@match_beginning, @match_middle, @match_end) }
    it { expect(described_class.search("b777")).to contain_exactly(@match_identification) }
  end
end
