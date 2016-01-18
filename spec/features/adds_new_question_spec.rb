require 'rails_helper'

feature "sees question description" do
  scenario "add a valid question successfull" do

    visit new_question_path
    fill_in "Title", with: "eltit"*10
    fill_in "Description", with: "noitpircsed"*15
    click_button "Create Question"

    expect(page).to have_content("Question successfully submitted.")
    expect(page).to have_content("eltit"*10)
    expect(page).to have_content("noitpircsed"*15)
  end

  scenario "fail to add a question because of a short title" do

    visit new_question_path
    fill_in "Title", with: "This title is short"
    fill_in "Description", with: "noitpircsed"*15
    click_button "Create Question"

    question = Question.new(title: "This title is short", description: "noitpircsed"*15)

    expect(page).to_not have_content("Question successfully submitted.")
    expect(page).to have_content(question.errors.full_messages.join(". "))
  end

  scenario "fail to add a question because of a short description" do

    visit new_question_path
    fill_in "Title", with: "eltit"*10
    fill_in "Description", with: "short desc"
    click_button "Create Question"

    question = Question.new(title: "eltit"*10, description: "short desc")

    expect(page).to_not have_content("Question successfully submitted.")
    expect(page).to have_content(question.errors.full_messages.join(". "))
  end

  scenario "fail to add a question because of a short description and short title" do

    visit new_question_path
    fill_in "Title", with: "short title"
    fill_in "Description", with: "short desc"
    click_button "Create Question"

    question = Question.new(title: "short title", description: "short desc")

    expect(page).to_not have_content("Question successfully submitted.")
    expect(page).to have_content(question.errors.full_messages.join(". "))
  end
end
