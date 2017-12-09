class QuestionController < ApplicationController
  def new
    @qid = params[:id]
    @qid ||= 1
  end
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
  end
  def create
    @question = Question.new(params[:question].permit(:qid, :text))
    @question.asked = false
    @question.save
    redirect_to @question
  end
end
