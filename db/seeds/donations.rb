puts "Seeding Donations ..."

donations = [
  donor: Donor.first,
  cause: Cause.first,
  amount: 100,
  event: Event.first
],
[
  donor: Donor.second,
  cause: Cause.first,
  amount: 200,
  event: Event.first
],
[
  donor: Donor.second,
  cause: Cause.first,
  amount: 300,
  event: Event.second
],
[
  donor: Donor.second,
  cause: Cause.first,
  amount: 400,
  event: Event.third
]

unless Donation.any?
  Donation.create!(donations)
end
