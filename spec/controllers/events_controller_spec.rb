require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let(:event) { instance_double(Event) }

  before do
    allow(event).to receive(:save) { save_result }
  end

  describe "POST #create" do
    before do
      post :create, event: FactoryGirl.attributes_for(:event)
    end

    context "when event is saved successfully" do
      let(:save_result) { true }

      it { expect(response).to have_http_status(:found) }
    end

    context "when event is not saved successfully" do
      let(:save_result) { false }

      it { expect(response).to have_http_status(:found) }
    end
  end
end
