class QuestionController < ApplicationController
  before_action :require_login
  def new
    @qid = params[:id]
    @qid ||= 1
  end
  def index
    @questions = Question.where("user=?", current_user.sid).order('created_at DESC')
  end
  def show
    @question = Question.find(params[:id])
  end
  def create
    @question = Question.new(params[:question].permit(:qid, :text))
    @question.asked = false
    @question.user = current_user.sid
    @question.save
    redirect_to @question
  end
end
