class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
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
    @question.user = current_user

    if @question.save!
      redirect_to @question, notice: 'Your Question was created successfully'
    else
      render :new
    end
  end

  def destroy
    @question.delete
    redirect_to @question, notice: 'Your question was deleted sucessfully'
  end

  def edit

  end

  private

  def question_params
    params.require(:question).permit(:question, :option_1, :option_2, :option_3, :correct_option)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
