require "rails_helper"

RSpec.describe Donation, type: :model do
  it { is_expected.to belong_to(:donor).inverse_of(:donations) }
  it { is_expected.to belong_to(:cause).inverse_of(:donations) }

  it { is_expected.to validate_presence_of(:donor) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }

  describe ".search" do
    let(:smithie_black) { create(:donor, name: "Smithie Black") }
    let(:bob_smith_white) { create(:donor, name: "Bob Smith-White") }
    let(:john_smith) { create(:donor, name: "John Smith") }
    let(:carl_grey) { create(:donor, name: "Carl Grey") }

    let(:match_beginning) { create(:donation, amount: 100, donor: smithie_black) }
    let(:match_middle) { create(:donation, amount: 100, donor: bob_smith_white) }
    let(:match_end) { create(:donation, amount: 100, donor: john_smith) }
    let(:no_match) { create(:donation, amount: 100, donor: carl_grey) }

    it { expect(described_class.search("smith")).to contain_exactly(match_beginning, match_middle, match_end) }
  end
end
