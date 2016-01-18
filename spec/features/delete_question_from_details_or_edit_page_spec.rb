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

  scenario "edit page delete button removes the selected question" do

    visit questions_path
    click_link question.title
    click_link "Edit Question"

    click_link "Delete Question"

    expect(page).to_not have_content(question.title)
  end

  scenario "question details page delete button removes the selected question" do

    visit questions_path
    click_link question.title

    click_link "Delete Question"

    expect(page).to_not have_content(question.title)
  end

  scenario "delete button removes all answers associated with that question from the database" do

    visit questions_path
    click_link question.title

    click_link "Delete Question"

    expect(Answer.all).to eq []
  end
end
