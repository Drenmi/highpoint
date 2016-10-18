require "rails_helper"

RSpec.describe DonationsController, type: :routing do
  it { expect(post: "donations").to route_to("donations#create") }
  it { expect(put: "donations/1").to route_to(controller: "donations", action: "update", id: "1") }
  it { expect(get: "donations/1/edit").to route_to(controller: "donations", action: "edit", id: "1") }
end
