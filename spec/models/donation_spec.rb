require "rails_helper"

RSpec.describe Donation, type: :model do
  it { is_expected.to belong_to(:donor).inverse_of(:donations) }
  it { is_expected.to belong_to(:cause).inverse_of(:donations) }

  it { is_expected.to validate_presence_of(:donor) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }

  describe ".search" do
    before do
      @match_behinning = create(:donation, donor: create(:donor, name: "Smithie Black"))
      @match_middle = create(:donation, donor: create(:donor, name: "Bob Smith White"))
      @match_end = create(:donation, donor: create(:donor, name: "John Smith"))
      @no_match = create(:donation, donor: create(:donor, name: "Carl Grey"))
    end

    it { expect(described_class.search("smith")).to match_array [@match_behinning, @match_middle, @match_end] }
  end

  describe ".donations_per_year" do
    before do
      create_list(:donation, 2)
      create(:donation, created_at: 1.year.ago)
    end

    it { expect(described_class.donations_per_year(Date.current.year).sum(:amount).round).to eq(200) }
  end
end
