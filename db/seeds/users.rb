puts "Seeding Users ..."

unless User.any?
  User.create!(
    email: "dawn@hcsa.org.sg",
    password: "123456",
    admin: true
  )
end
