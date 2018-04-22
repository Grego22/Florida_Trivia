class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all.order('created_at DESC')
  end


  def show
    @quiz = Quiz.find(params[:id])
  end


  def new
    @quiz = Quiz.new
    4.times { @quiz.questions.build }
  end


  def edit
    @quiz = Quiz.find(params[:id])
  end


  def create
    @quiz = Quiz.create(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Quiz was successfully created.'
    else
      render :new
    end
  end


  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private


  def quiz_params
    params.require(:quiz).permit(:id, :quiz,
                                 quetions_attributes: [:id, :option_1, :option_2, :option_3, :correct_option])
    def set_quiz
      @quiz = Question.find(params[:id])
    end
  end
end
