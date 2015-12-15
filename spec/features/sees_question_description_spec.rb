require 'rails_helper'

feature "sees question description" do
  scenario "see the description for a given question" do
    valid_desc = ""
    150.times { valid_desc += "a" }
    question = Question.create(
    title: "This is a 40 character long question i think????",
    description: valid_desc)

    visit questions_path
    click_link question.title

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
