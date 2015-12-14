class QuestionsController < ApplicationController
  def index
    @questions_by_date = Question.all.order(:created_at)

  end
end
