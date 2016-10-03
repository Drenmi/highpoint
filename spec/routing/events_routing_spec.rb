require "rails_helper"

RSpec.describe EventsController, type: :routing do
  it { expect(post: "events").to route_to("events#create") }
  it { expect(get: "events").to route_to("events#index") }
end
