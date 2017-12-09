class JudgeController < ApplicationController
  protect_from_forgery with: :null_session
  def update
    puts params[:id]
    @submission = Submission.where("uuid=?", params[:id]).first
    @submission.judged = true;
    @submission.result = params[:result]
    @submission.save()
    render plain: "OK"
  end
end
