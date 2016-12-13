puts "Seeding Users ..."

unless User.any?
  User.create!(
   email: "dawn@highpoint.com",
   password: "123456",
   admin: true)
end
