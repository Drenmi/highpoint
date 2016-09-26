require "rails_helper"

RSpec.describe DonationsController, type: :controller do
  let(:donation) { instance_double(Donation) }

  before do
    allow(donation).to receive(:save) { save_result }
    allow(subject).to receive(:find_donation) { donation }
  end

  describe "POST #create" do
    before do
      post :create, donation: FactoryGirl.attributes_for(:donation)
    end

    context "when donor is saved successfully" do
      let(:save_result) { true }

      it { expect(response).to have_http_status(:found) }
    end

    context "when donor is not saved successfully" do
      let(:save_result) { false }

      it { expect(response).to have_http_status(:found) }
    end
  end
end
