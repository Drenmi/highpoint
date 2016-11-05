require "rails_helper"

RSpec.describe EventsController, type: :controller do
  before do
    sign_in
    allow(subject).to receive(:find_event) { event }
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

  describe "GET #show" do
    let(:donation) { FactoryGirl.build(:donation, amount: 100) }
    let(:event) { FactoryGirl.build(:event, donations: [donation]) }

    before { get :show, id: 1 }

    context "when event exists" do
      it { expect(response).to have_http_status(:success) }
    end
  end

  describe "PUT #update/:id" do
    let(:event) { Event.create(name: "Test Event", start_on: 2.years.ago, end_on: 1.year.ago + 3.days) }
    let(:attr) { { name: "Edited event", start_on: 1.year.ago.to_date, end_on: (1.year.ago + 1.day).to_date } }

    before(:each) do
      put :update, id: event.id, event: attr
      event.reload
    end

    it { expect(event.name).to eq attr[:name] }
    it { expect(event.start_on).to eq attr[:start_on] }
    it { expect(event.end_on).to eq attr[:end_on] }
  end
end
