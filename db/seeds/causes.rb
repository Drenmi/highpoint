puts "Seeding Causes ..."

causes = [
  shortcode: "GE",
  name: "General"
],
[
  shortcode: "HH",
  name: "Halfway House"
],
[
  shortcode: "NLC",
  name: "NLC"
],
[
  shortcode: "RTC",
  name: "RTC"
]

unless Cause.any?
  Cause.create!(causes)
end
