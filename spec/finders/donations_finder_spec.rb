require "rails_helper"

RSpec.describe DonationsReportsFinder, type: :finder do
  subject(:finder) { described_class.new(params) }

  before do
    @donation_with_year = create(:donation, created_at: 2.years.ago)
    @donation_with_month = create(:donation, created_at: 2.months.ago)
    @donation_with_cause = create(:donation_with_cause)
    @donation_with_event = create(:donation_with_event)
  end

  describe "#filter" do
    context "when no params are passed" do
      let(:params) { {} }

      it { expect(finder.filter.to_a).to eq [@donation_with_year, @donation_with_month, @donation_with_cause, @donation_with_event] }
    end

    context "when year is passed" do
      let(:params) { { date: { year: 2.years.ago.year } } }

      it { expect(finder.filter.to_a).to eq [@donation_with_year] }
    end

    context "when month and year are passed" do
      let(:params) { { date: { year: 2.months.ago.year, month: 2.months.ago.month } } }

      it { expect(finder.filter.to_a).to eq [@donation_with_month] }
    end

    context "when cause_id is passed" do
      let(:params) { { cause_id: @donation_with_cause.cause.id } }

      it { expect(finder.filter.references(:cause).to_a).to eq [@donation_with_cause] }
    end

    context "when event_id is passed" do
      let(:params) { { event_id: @donation_with_event.event.id } }

      it { expect(finder.filter.references(:cause).to_a).to eq [@donation_with_event] }
    end
  end
end
