require "rails_helper"

RSpec.describe Cause, type: :model do
  it { is_expected.to have_many(:donations).inverse_of(:cause) }

  it { is_expected.to validate_presence_of(:shortcode) }
  it { is_expected.to validate_presence_of(:name) }

  describe ".top_donation_for_year" do
    before do
      @cause = create(:cause)
      @donation100 = create(:donation, cause: @cause, amount: 100)
      @donation200 = create(:donation, cause: @cause, amount: 200)
      @donation300 = create(:donation, cause: @cause, amount: 300)
    end

    it { expect(@cause.top_donation_for_year).to eq(@donation300) }
  end
end
