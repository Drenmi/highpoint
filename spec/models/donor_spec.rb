require "rails_helper"

RSpec.describe Donor, type: :model do
  it { is_expected.to have_many(:donations).inverse_of(:donor) }

  it { is_expected.to validate_presence_of(:identification) }

  describe "#total_donations" do
    let(:donor) { FactoryGirl.create(:donor_with_donations) }

    it "shows total amount donated" do
      expect(donor.total_donations).to eq(200)
    end
  end
end
