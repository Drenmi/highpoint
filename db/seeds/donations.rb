puts "Seeding Donations ..."

donations = [
  donor: Donor.first,
  cause: Cause.first,
  amount: 100,
  event: Event.first
],
[
  donor: Donor.last,
  cause: Cause.first,
  amount: 200,
  event: Event.first
],
[
  donor: Donor.last,
  cause: Cause.first,
  amount: 300,
  event: Event.first
]

unless Donation.any?
  Donation.create!(donations)
end
