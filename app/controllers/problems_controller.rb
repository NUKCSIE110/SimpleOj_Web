class ProblemsController < ApplicationController
  before_action :require_login
  def index
    @problems = Problem.all
    @status = ["AC", "WA", "AC"]
  end

  def show
    @id = params[:id]
    @problem = Problem.find(@id)
    @status = "AC";
  end


  def create
    @problem = Problem.new(params[:problem].permit(:title, :text))
    @problem.save
    redirect_to @problem
  end
end
