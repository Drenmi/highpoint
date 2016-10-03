puts "Seeding Events ..."

events = [
    name: "Past Event",
    start_on: 1.year.ago,
    end_on: 1.year.ago + 1.day
  ],
  [
    name: "Future Event",
    start_on: 1.year.from_now,
    end_on: 1.year.from_now + 1.day
  ]

unless Event.any?
  Event.create!(events)
end
