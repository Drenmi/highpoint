require "rails_helper"

RSpec.describe DonorsController, type: :controller do
  let(:donor) { instance_double(Donor) }

  before do
    sign_in
    allow(subject).to receive(:find_donor) { donor }
  end

  describe "GET #show" do
    before { get :show, id: 1 }

    context "when donor exists" do
      it { expect(response).to have_http_status(:success) }
    end
  end
end
