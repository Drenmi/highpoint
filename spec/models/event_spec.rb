require "rails_helper"

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:start_on) }
  it { is_expected.to validate_presence_of(:end_on) }
  it { is_expected.to validate_presence_of(:name) }

  describe ".search" do
    let(:match_beginning) { create(:event, name: "Event in the Past") }
    let(:match_middle) { create(:event, name: "Future Event") }
    let(:match_end) { create(:event, name: "Some Event happening now") }
    let(:no_match) { create(:event, name: "Christmas dinner with donors") }

    it { expect(described_class.search("event")).to contain_exactly(match_beginning, match_middle, match_end) }
  end

  describe "#total_donations" do
    let(:event) { create(:event_with_donations) }

    it { expect(event.total_donations).to eq(200) }
  end
end
