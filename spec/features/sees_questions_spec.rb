require 'rails_helper'

feature "sees questions" do
  scenario "see all the questions in order of submission" do

    question_one = Question.create(title: "eltit"*10, description: "noitpircsed"*15)
    question_two = Question.create(title: "eltit2"*10, description: "noitpircsedowt"*15)

    visit questions_path
    expect(page).to have_content(question_two.title + " " + question_one.title)
  end
end
