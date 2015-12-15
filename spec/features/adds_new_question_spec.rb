require 'rails_helper'

feature "sees question description" do
  scenario "add a valid question successfull" do
    valid_desc = ""
    150.times { valid_desc += "a" }
    title = "This is a 40 character long question i think????"

    visit new_question_path
    fill_in "Title", with: title
    fill_in "Description", with: valid_desc
    click_button "Create Question"

    expect(page).to have_content("Question successfully submitted.")
    expect(page).to have_content(title)
    expect(page).to have_content(valid_desc)
  end

  scenario "fail to add a question because of a short title" do
    valid_desc = ""
    150.times { valid_desc += "a" }
    title = "This title is short"

    visit new_question_path
    fill_in "Title", with: title
    fill_in "Description", with: valid_desc
    click_button "Create Question"

    expect(page).to_not have_content("Question successfully submitted.")
    expect(page).to have_content("Title must be at least 40 characters")
  end

  scenario "fail to add a question because of a short description" do
    valid_desc = ""
    15.times { valid_desc += "a" }
    title = "This is a 40 character long question i think????"

    visit new_question_path
    fill_in "Title", with: title
    fill_in "Description", with: valid_desc
    click_button "Create Question"

    expect(page).to_not have_content("Question successfully submitted.")
    expect(page).to have_content("Description must be at least 150 characters.")
  end

  scenario "fail to add a question because of a short description and short title" do
    valid_desc = ""
    15.times { valid_desc += "a" }
    title = "short title"

    visit new_question_path
    fill_in "Title", with: title
    fill_in "Description", with: valid_desc
    click_button "Create Question"

    expect(page).to_not have_content("Question successfully submitted.")
    expect(page).to have_content("Title must be at least 40 characters, and description must be at least 150 characters.")
  end
end
