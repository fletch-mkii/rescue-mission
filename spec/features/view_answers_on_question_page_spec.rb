require 'rails_helper'

feature "sees answers on question detail page" do
    let(:question) { Question.create(title: "link"*10, description: "a"*150) }
    let(:ans_one) { Answer.create(username: "bigboy", description: "b"*50, question_id: question.id) }
    let(:ans_two) { Answer.create(username: "lilboy", description: "c"*50, question_id: question.id) }

    before(:each) do
      question.save
      ans_one.save
      ans_two.save
    end

  scenario "answer descriptions and usernames show up on the question page" do

    visit questions_path
    click_link question.title

    expect(page).to have_content(question.title)
    expect(page).to have_content(ans_one.description)
    expect(page).to have_content(ans_one.username)
    expect(page).to have_content(ans_two.description)
    expect(page).to have_content(ans_two.username)
  end

  scenario "answers are in order from newest to oldest" do

    visit questions_path
    click_link question.title

    expect(page).to have_content("#{ans_two.description} #{ans_two.username} #{ans_one.description} #{ans_one.username}")
  end
end
