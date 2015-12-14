require 'rails_helper'

feature "sees question description" do
  scenario "see the description for a given question" do
    question = Question.create(title: "Help with C++?", description: "What is a loop?")

    visit questions_path
    click_link "Help with C++?"

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
