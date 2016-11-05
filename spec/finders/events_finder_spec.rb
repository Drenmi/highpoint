require "rails_helper"

RSpec.describe EventsFinder, type: :finder do
  subject(:finder) { described_class.new(params) }

  before do
    @event_one = create(:event_with_donations, start_on: 2.years.ago - 1.day)
    @event_two = create(:event, start_on: 2.years.ago, name: "Past Event")
    @event_three = create(:event, start_on: 2.years.ago + 1.day, donations: [create(:donation)], name: "Something from the past")
  end

  describe "#find_all" do
    context "when no params are passed" do
      let(:params) { {} }

      it { expect(finder.find_all.to_a).to eq [@event_three, @event_two, @event_one] }
    end

    context "when sort_direction is passed" do
      let(:params) { { direction: "ASC" } }

      it { expect(finder.find_all.to_a).to eq [@event_one, @event_two, @event_three] }
    end

    context "when sort_column is passed" do
      let(:params) { { sort: "total_donations", direction: "ASC" } }

      it { expect(finder.find_all.to_a).to eq [@event_two, @event_three, @event_one] }
    end

    context "when keyword is passed" do
      let(:params) { { search: "Past" } }

      it { expect(finder.find_all.to_a).to eq [@event_three, @event_two] }
    end
  end
end
