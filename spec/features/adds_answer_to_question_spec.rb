require 'rails_helper'

feature "sees question description" do

  let(:question) { Question.new(title: "link"*10, description: "a"*150) }

  before(:each) do
    question.save
  end

  scenario "submit an answer successfully" do

    visit questions_path
    click_link question.title

    fill_in "Username", with: "answerman"
    fill_in "Description", with: "answer"*10
    click_button "Create Answer"

    expect(page).to have_content("Answer saved successfully.")
    expect(page).to have_content("answerman")
    expect(page).to have_content("answer"*10)
  end

  scenario "fail to submit an answer with no username" do

    visit questions_path
    click_link question.title

    fill_in "Description", with: "answer"*10
    click_button "Create Answer"

    expect(page).to have_content(question.errors.full_messages.join(". "))
    expect(page).to have_content(question.title)
  end

  scenario "fail to submit an answer with too short of a description" do

    visit questions_path
    click_link question.title

    fill_in "Username", with: "answerman"
    fill_in "Description", with: "short"
    click_button "Create Answer"

    expect(page).to have_content(question.errors.full_messages.join(". "))
    expect(page).to have_content(question.title)
  end

  scenario "fail to submit an answer with no username too short of a description" do

    visit questions_path
    click_link question.title

    fill_in "Description", with: "short"
    click_button "Create Answer"

    expect(page).to have_content(question.errors.full_messages.join(". "))
    expect(page).to have_content(question.title)
  end
end
