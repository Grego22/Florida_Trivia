class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Your Question was created successfully'
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:question, :option_1, :option_2, :option_3, :correct_option)
  end
end
