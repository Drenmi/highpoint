puts "Seeding Causes ..."

causes = [
  shortcode: "HH",
  name: "Halfway House"
],
[
  shortcode: "GE",
  name: "General"
]

unless Cause.any?
  Cause.create!(causes)
end
