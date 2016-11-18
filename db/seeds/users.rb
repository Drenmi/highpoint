puts "Seeding Users ..."

users = [
  email: "dawn@highpoint.com",
  password: "123456"
],
[
  email: "hcsa.test@gmail.com",
  password: "123456"
]

unless User.any?
  User.create!(users)
end
