# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

valid_desc = ""
150.times { valid_desc += "a" }
Question.create(title: "This is a 40 character long question about C++???", description: valid_desc)
Question.create(title: "This is a 40 character long question about Java???", description: valid_desc)
