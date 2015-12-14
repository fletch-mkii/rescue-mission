require 'rails_helper'

feature "sees questions" do
  scenario "see all the questions in order of submission" do
    question_one = Question.create(title: "Help with C++?")
    question_two = Question.create(title: "Help with Java?")

    visit questions_path
    expect(page).to have_content(question_one.title + " " + question_two.title)
  end
end
