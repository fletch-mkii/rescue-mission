require 'rails_helper'

feature "sees question description" do
  scenario "submit an answer successfully" do
    ques_desc = ""
    30.times { ques_desc += "question" }
    question = Question.create(
    title: "This is a 40 character long question i think????",
    description: ques_desc)
    ans_desc = ""
    10.times { ans_desc += "answer" }
    # answer = Answer.create(username: "answerman", description: ques_desc, question_id: question.id)

    visit questions_path
    click_link question.title

    fill_in "Username", with: "answerman"
    fill_in "Description", with: ans_desc
    click_button "Create Answer"

    expect(page).to have_content("Answer saved successfully.")
    expect(page).to have_content("answerman")
    expect(page).to have_content(ans_desc)
  end

  scenario "fail to submit an answer with no username" do
    ques_desc = ""
    30.times { ques_desc += "question" }
    question = Question.create(
    title: "This is a 40 character long question i think????",
    description: ques_desc)
    ans_desc = ""
    10.times { ans_desc += "answer" }
    # answer = Answer.create(username: "answerman", description: ques_desc, question_id: question.id)

    visit questions_path
    click_link question.title

    fill_in "Description", with: ans_desc
    click_button "Create Answer"

    expect(page).to have_content("A username is required")
    expect(page).to have_content(question.title)
  end

  scenario "fail to submit an answer with too short of a description" do
    ques_desc = ""
    30.times { ques_desc += "question" }
    question = Question.create(
    title: "This is a 40 character long question i think????",
    description: ques_desc)
    ans_desc = ""
    10.times { ans_desc += "answer" }
    # answer = Answer.create(username: "answerman", description: ques_desc, question_id: question.id)

    visit questions_path
    click_link question.title

    fill_in "Username", with: "answerman"
    fill_in "Description", with: "short"
    click_button "Create Answer"

    expect(page).to have_content("Description must be at least 50 characters long.")
    expect(page).to have_content(question.title)
  end

  scenario "fail to submit an answer with no username too short of a description" do
    ques_desc = ""
    30.times { ques_desc += "question" }
    question = Question.create(
    title: "This is a 40 character long question i think????",
    description: ques_desc)
    ans_desc = ""
    10.times { ans_desc += "answer" }
    # answer = Answer.create(username: "answerman", description: ques_desc, question_id: question.id)

    visit questions_path
    click_link question.title

    fill_in "Description", with: "short"
    click_button "Create Answer"

    expect(page).to have_content("A username is required and your description must be at least 50 characters long.")
    expect(page).to have_content(question.title)
  end
end
