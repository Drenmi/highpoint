require "rails_helper"

RSpec.describe DonationsController, type: :controller do
  before do
    sign_in
    allow(subject).to receive(:find_donation) { donation }
  end

  describe "POST #create" do
    let(:donor) { Donor.create(identification: "N111111") }
    let(:donation) { Donation.create(amount: 100, donor: donor) }

    before do
      allow(donation).to receive(:save) { save_result }
      post :create, donation: attributes_for(:donation)
    end

    context "when donation is saved successfully" do
      let(:save_result) { true }

      it { expect(response).to redirect_to(donor_path(donation.donor)) }
    end

    context "when donation is not saved successfully" do
      let(:save_result) { false }

      it { expect(response).to have_http_status(:found) }
    end
  end

  describe "PUT #update/:id" do
    let(:donor) { Donor.create(identification: "N111111") }
    let(:donation) { Donation.create(amount: 100, donor: donor) }
    let(:cause) { Cause.create(shortcode: "TC", name: "Test Cause") }
    let(:event) { Event.create(name: "Test Event", start_on: "2015-10-19", end_on: "2015-10-20") }
    let(:attr) { { amount: 200, cause_id: cause.id, event_id: event.id, created_at: "2015-11-22 00:00:00" } }

    before(:each) do
      put :update, id: donation.id, donation: attr
      donation.reload
    end

    it { expect(donation.amount).to eq attr[:amount] }
    it { expect(donation.cause_id).to eq cause.id }
    it { expect(donation.event_id).to eq event.id }
    it { expect(donation.created_at).to eq attr[:created_at] }
  end
end
