# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

school = School.create(name: Faker::University.name)

5.times do |i|
  password = '12345678'
  school.members.create(name: Faker::Name.unique.name, kype: 0, password: password, confirm_password: password)
end

20.times do |i|
  password = '12345678'
  school.members.create(name: Faker::Name.unique.name, kype: 1, password: password, confirm_password: password)
end