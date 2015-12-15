require 'rails_helper'

feature "sees questions" do
  scenario "see all the questions in order of submission" do
    
    valid_desc = ""
    150.times { valid_desc += "a" }

    question_one = Question.create(
    title: "This is a 40 character long question i think????",
    description: valid_desc)

    question_two = Question.create(
    title: "This is also a 40 character long question i think????",
    description: valid_desc)

    visit questions_path
    expect(page).to have_content(question_two.title + " " + question_one.title)
  end
end
