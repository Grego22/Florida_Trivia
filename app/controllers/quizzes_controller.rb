class QuizzesController < ApplicationController
  # GET /quizzes
  def index
    @quizzes = Quiz.all.order('created_at DESC')
  end

  # GET /quizzes/1
  def show
    @quiz = Quiz.find(params[:id])
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Quiz was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def quiz_params
    params.fetch(:quiz, {})
  end
end
