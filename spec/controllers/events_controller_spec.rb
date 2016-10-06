require "rails_helper"

RSpec.describe EventsController, type: :controller do
  before do
    sign_in
  end

  describe "POST #create" do
    let(:event) { instance_double(Event) }

    before do
      allow(event).to receive(:save) { save_result }
      post :create, event: attributes_for(:event)
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

  describe "GET #index" do
    let(:event) { class_double(Event) }

    before do
      allow(event).to receive(finder_method) { [] }
      get :index, keyword: keyword
    end

    context "when searching" do
      let(:keyword) { "foo" }
      let(:finder_method) { :all }

      it { expect(response).to have_http_status(:ok) }
    end

    context "when not searching" do
      let(:keyword) { "" }
      let(:finder_method) { :search }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
