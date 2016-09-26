require "rails_helper"

RSpec.describe DonationsController, type: :routing do
  it { expect(post: "donations").to route_to("donations#create") }
end
