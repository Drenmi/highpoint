puts "Seeding Donors ..."

unless Donor.any?
  Donor.create!(
    identification: "G1234567M",
    name: "John Smith",
    address: "123 Street, 0123456 Singapore",
    phone_number: "12345678",
    email_address: "john.smith@example.com"
  )
end
