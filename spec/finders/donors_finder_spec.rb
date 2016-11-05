require "rails_helper"

RSpec.describe DonorsFinder, type: :finder do
  subject(:finder) { described_class.new(params) }

  before do
    @donor_no_donations = create(:donor, created_at: 1.year.ago, name: "Bob")
    @donor_one_donation = create(:donor, created_at: 2.years.ago, name: "Bob number two")
    @donor_two_donations = create(:donor_with_donations)
    @donation_with_cause = create(:donation_with_cause, donor: @donor_one_donation)
  end

  describe "#find_all" do
    context "when no params are passed" do
      let(:params) { {} }

      it { expect(finder.find_all.to_a).to eq [@donor_two_donations, @donor_no_donations, @donor_one_donation] }
    end

    context "when sort_direction is passed" do
      let(:params) { { direction: "ASC" } }

      it { expect(finder.find_all.to_a).to eq [@donor_one_donation, @donor_no_donations, @donor_two_donations] }
    end

    context "when filter is passed" do
      let(:params) { { cause_id: @donation_with_cause.cause.id } }

      it { expect(finder.find_all.to_a).to eq [@donor_one_donation] }
    end

    context "when keyword is passed" do
      let(:params) { { search: "bob" } }

      it { expect(finder.find_all.to_a).to eq [@donor_no_donations, @donor_one_donation] }
    end

    context "when filter and keyword are passed" do
      let(:params) { { cause_id: @donation_with_cause.cause.id, search: "bob" } }

      it { expect(finder.find_all.to_a).to eq [@donor_one_donation] }
    end
  end
end
