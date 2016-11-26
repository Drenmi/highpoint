require "rails_helper"

RSpec.describe DonationsFinder, type: :finder do
  subject(:finder) { described_class.new(params, event) }

  before do
    @event = create(:event, id: 1)
    @donation_one = create(:donation, amount: 200, created_at: "2015-11-21 00:00:00", donor: create(:donor, name: "Bob Smith"), event: @event)
    @donation_two = create(:donation, amount: 100, created_at: "2016-11-21 00:00:00", donor: create(:donor, name: "Anonymous"), event: @event)
    @donation_three = create(:donation, amount: 300, created_at: "2017-11-21 00:00:00", donor: create(:donor, name: "John Smith"), event: @event)
  end

  describe "#find_all" do
    context "when no params are passed" do
      let(:params) { {} }
      let(:event) { @event }

      it { expect(finder.find_all.to_a).to eq [@donation_three, @donation_two, @donation_one] }
    end

    context "when sort_direction is passed" do
      let(:params) { { direction: "ASC" } }
      let(:event) { @event }

      it { expect(finder.find_all.to_a).to eq [@donation_one, @donation_two, @donation_three] }
    end

    context "when sort_column is passed" do
      let(:params) { { sort: "amount", direction: "ASC" } }
      let(:event) { @event }

      it { expect(finder.find_all.to_a).to eq [@donation_two, @donation_one, @donation_three] }
    end

    context "when keyword is passed" do
      let(:params) { { search: "Smith" } }
      let(:event) { @event }

      it { expect(finder.find_all.to_a).to eq [@donation_three, @donation_one] }
    end

    context "when sort and keyword are passed" do
      let(:params) { { sort: "donor_name", direction: "ASC", search: "smi" } }
      let(:event) { @event }

      it { expect(finder.find_all.to_a).to eq [@donation_one, @donation_three] }
    end
  end
end
