puts "Seeding Donors ..."

donors = [
  identification: "Anonymous",
  name: "Anonymous",
  address: "",
  phone_number: "",
  email_address: ""
]

unless Donor.any?
  Donor.create!(donors)
end
