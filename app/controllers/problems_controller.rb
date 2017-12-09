class ProblemsController < ApplicationController
  before_action :require_login
  def index
    @problems = Problem.all
    @status = [];
    for i in 0..4
      @status[i] = Submission.where("user=? AND qid=? AND result=?", @current_user.sid, i+1, "AC").order('created_at DESC').first
      if @status[i].nil?
        @status[i] = Submission.where("user=? AND qid=?", @current_user.sid, i+1).order('created_at DESC').first
      end
      if !@status[i].nil?
        @status[i] = @status[i].result
      end
    end
  end

  def show
    @id = params[:id]
    @problem = Problem.find(@id)
  end


  def create
    #@problem = Problem.new(params[:problem].permit(:title, :text))
    #@problem.save
    redirect_to @problem
  end
end
