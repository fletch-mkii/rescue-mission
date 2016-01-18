class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
    @answer = Answer.new
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
      flash[:errors] = @question.errors.full_messages.join(". ")
      # flash.now[:notice] = "Title must be at least 40 characters" if @question.title.length < 40
      # flash.now[:notice] = "Description must be at least 150 characters." if @question.description.length < 150
      # flash.now[:notice] = "Title must be at least 40 characters, and description must be at least 150 characters." if @question.description.length < 150 && @question.title.length < 40
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = "Question successfully submitted."
      redirect_to @question
    else
      flash.now[:notice] = "Title must be at least 40 characters" if question_params[:title].length < 40
      flash.now[:notice] = "Description must be at least 150 characters." if question_params[:description].length < 150
      flash.now[:notice] = "Title must be at least 40 characters, and description must be at least 150 characters." if question_params[:description].length < 150 && question_params[:title].length < 40
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    @question.destroy
    @answers.destroy_all

    flash[:notice] = "Question Successfully deleted"
    redirect_to questions_path
  end
  #
  # def destroy
  #  @post = Post.find(params[:post_id])
  #  @comment = Comment.find(params[:id])
  #  @comment.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to post_comments_path(@post) }
  #    format.xml  { head :ok }
  #  end
 # end

  private

  def question_params
    params.require(:question).permit(:title,:description)
  end
end
