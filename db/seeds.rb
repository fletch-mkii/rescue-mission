# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(title: "This is a 40 character long question about C++???", description: "a"*150)
Question.create(title: "This is a 40 character long question about Java???", description: "z"*150)

Answer.create(username: "bigboy", description: "b"*50, question_id: 1)
Answer.create(username: "lilboy", description: "c"*50, question_id: 1)
Answer.create(username: "lilboy", description: "d"*50, question_id: 2)
Answer.create(username: "lilboy", description: "e"*50, question_id: 2)
Answer.create(username: "lilboy", description: "f"*50, question_id: 2)
