puts "Seeding Causes ..."

unless Cause.any?
  Cause.create!(
    shortcode: "HH",
    name: "Halfway House"
  )
end
