require "rails_helper"

RSpec.describe Cause, type: :model do
  it { is_expected.to have_many(:donations).inverse_of(:cause) }

  it { is_expected.to validate_presence_of(:shortcode) }
  it { is_expected.to validate_presence_of(:name) }
end
