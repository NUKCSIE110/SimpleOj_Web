class JudgeController < ApplicationController
  protect_from_forgery with: :null_session
  def update
    #puts params[:id]
    @submission = Submission.where("uuid=?", params[:id]).first
    @submission.judged = true;
    @submission.result = params[:result]
    @submission.save()
    @qid = @submission.qid
    @user = User.where("sid=?", @submission.user).first
    @user.ac ||= 0
    @user.score ||= 0
    if params[:result] != "AC"
      @user.score -= 20
    elsif (@user.ac)>>(@qid)&1 != 1
      @user.score += ((exp_time.to_i-Time.now.utc.to_i)/60).floor
      @user.ac |= 1<<(@qid)
    end
    @user.save()
    render plain: "OK"
  end
end
