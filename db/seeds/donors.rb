puts "Seeding Donors ..."

donors = [
  identification: "Anonymous",
  name: "Anonymous",
  address: "",
  phone_number: "",
  email_address: ""
],
[
  identification: "G1234567M",
  name: "John Smith",
  address: "123 Street, 0123456 Singapore",
  phone_number: "12345678",
  email_address: "john.smith@example.com"
],
[
  identification: "G111111M",
  name: "Smithie Black",
  address: "555 Street, 0123456 Singapore",
  phone_number: "12345678",
  email_address: "smithie.black@example.com"
],
[
  identification: "G7654321M",
  name: "Jack Blacksmith",
  address: "666 Street, 0123456 Singapore",
  phone_number: "12345678",
  email_address: "jack.blacksmith@example.com"
]

unless Donor.any?
  Donor.create!(donors)
end
