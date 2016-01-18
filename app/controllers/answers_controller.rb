class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to @question
    else
      flash[:errors] = @question.errors.full_messages.join(". ")
      # flash[:notice] = "A username is required" if @answer.username.empty?
      # flash[:notice] = "Description must be at least 50 characters long." if @answer.description.length < 50
      # flash[:notice] = "A username is required and your description must be at least 50 characters long." if @answer.username.empty? && @answer.description.length < 50
      # redirect_to @question
      @answers = @question.answers.order(created_at: :desc)
      render :'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:username,:description)
  end
end
