require 'rails_helper'

feature "sees questions" do
  scenario "see all the questions" do
    question_one = Question.create(title: "Help with C++?")
    question_two = Question.create(title: "Help with Java?")

    visit questions_path
    expect(page).to have_content(question_one.title)
    expect(page).to have_content(question_two.title)
  end
end
