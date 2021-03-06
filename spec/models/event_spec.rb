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

  describe "#start_before_end" do
    let(:event) { build(:event, name: "Test dates input", start_on: 1.year.ago + 1.day, end_on: 1.year.ago) }

    it { expect(event).to_not be_valid }
  end

  describe "paper_trail", versioning: true do
    it { is_expected.to be_versioned }

    let(:event) { Event.create! name: "First name", start_on: 1.year.ago, end_on: 5.months.ago }

    before do
      event.update_attributes!(name: "Second name")
      event.update_attributes!(name: "Third name")
      event.update_attributes!(name: "First name")
    end

    it "is possible to do assertions on version attributes" do
      expect(event).to have_a_version_with name: "Second name"
      expect(event).to have_a_version_with name: "Third name"
      expect(event).to have_a_version_with name: "First name"
      expect(event).to_not have_a_version_with name: "Random name"
    end
  end
end
