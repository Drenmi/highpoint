puts "Seeding Events ..."

events = [
    name: "Event in the Past",
    start_on: 1.year.ago,
    end_on: 1.year.ago + 1.day
  ],
  [
    name: "Future Event",
    start_on: 1.year.from_now,
    end_on: 1.year.from_now + 1.day
  ],
  [
    name: "Some Event happening now",
    start_on: Date.today,
    end_on: Date.today + 1.day
  ],
  [
    name: "Christmas dinner with donors",
    start_on: 1.month.from_now,
    end_on: 1.month.from_now + 1.day
  ]

unless Event.any?
  Event.create!(events)
end
