class QuestionsController < ApplicationController
  def index
    @questions_by_date = Question.all.order(created_at: :desc)
  end

  def show
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question successfully submitted."
      redirect_to @question
    else
      flash.now[:notice] = "Title must be at least 40 characters" if @question.title.length < 40
      flash.now[:notice] = "Description must be at least 150 characters." if @question.description.length < 150
      flash.now[:notice] = "Title must be at least 40 characters, and description must be at least 150 characters." if @question.description.length < 150 && @question.title.length < 40
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title,:description)
  end
end
