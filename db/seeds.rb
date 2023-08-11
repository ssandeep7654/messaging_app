# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
password = '12345678'
1.upto(5) do |i|
  User.create(
    first_name: "User#{i}",
    last_name: "Last#{i}",
    username: "username#{i}",
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end
