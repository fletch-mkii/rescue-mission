require 'rails_helper'

feature "edit questions" do
    let(:question) { Question.new(title: "link"*10, description: "a"*150) }
    let(:ans_one) { Answer.new(username: "bigboy", description: "b"*50, question_id: question.id) }
    let(:ans_two) { Answer.new(username: "lilboy", description: "c"*50, question_id: question.id) }

    before(:each) do
      question.save
      ans_one.save
      ans_two.save
    end

  scenario "form exists on edit page with old question information filled in" do

    visit questions_path
    click_link question.title
    click_link "Edit Question"

    find_field('Title').value.should eq question.title
    find_field('Description').value.should eq question.description
  end

  scenario "update submits successfully" do

    visit questions_path
    click_link question.title
    click_link "Edit Question"

    fill_in "Title", with: question.title + "title addon"
    fill_in "Description", with: question.description + "desc addon"

    click_button "Update Question"

    expect(page).to have_content("Question successfully submitted.")
    expect(page).to have_content(question.title + "title addon")
    expect(page).to have_content(question.description + "desc addon")

  end
end
