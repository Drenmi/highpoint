puts "Seeding Donations ..."

unless Donation.any?
  Donation.create!(
    donor: Donor.first,
    cause: Cause.first,
    event: Event.first,
    amount: 100
  )
end
