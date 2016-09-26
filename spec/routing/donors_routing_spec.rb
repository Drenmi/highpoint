require "rails_helper"

RSpec.describe DonorsController, type: :routing do
  it { expect(get: "donors/1").to route_to("donors#show", id: "1") }
end
