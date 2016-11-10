puts "Seeding Donations ..."

donations = [
  donor: Donor.first,
  cause: Cause.first,
  amount: 20,
  event: Event.first,
  created_at: 1.year.ago - 4.months
],
[
  donor: Donor.first,
  cause: Cause.first,
  amount: 50,
  event: Event.second,
  created_at: 1.year.ago - 1.months
],
[
  donor: Donor.first,
  cause: Cause.first,
  amount: 100,
  event: Event.first,
  created_at: 6.months.ago
],
[
  donor: Donor.second,
  cause: Cause.first,
  amount: 200,
  event: Event.first,
  created_at: 2.months.ago
],
[
  donor: Donor.second,
  cause: Cause.first,
  amount: 250,
  event: Event.first,
  created_at: 2.months.ago - 9.days
],
[
  donor: Donor.second,
  cause: Cause.first,
  amount: 350,
  event: Event.first,
  created_at: 2.months.ago - 1.days
],
[
  donor: Donor.second,
  cause: Cause.second,
  amount: 300,
  event: Event.second,
  created_at: 4.months.ago
],
[
  donor: Donor.second,
  cause: Cause.second,
  amount: 400,
  event: Event.third,
  created_at: 5.days.ago
],
[
  donor: Donor.third,
  cause: Cause.second,
  amount: 450,
  event: Event.third,
  created_at: 2.days.ago
],
[
  donor: Donor.third,
  cause: Cause.second,
  amount: 550,
  created_at: 2.days.ago
],
[
  donor: Donor.third,
  cause: Cause.third,
  amount: 500
],
[
  donor: Donor.third,
  cause: Cause.fourth,
  amount: 600
]

unless Donation.any?
  Donation.create!(donations)
end
