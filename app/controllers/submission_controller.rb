class SubmissionController < ApplicationController
  before_action :require_login
  require 'digest/md5'
  def new
    @qid = params[:id]
    @qid ||= 1
  end
  def create
    @uuid = Digest::MD5.hexdigest(params[:submission][:code])
    if Submission.where("uuid=?", @uuid).first.nil?
      @qid = params[:submission][:qid]
      @submission = Submission.new(params[:submission].permit(:qid, :code, :lang))
      @submission.uuid = @uuid
      @submission.user = @current_user.sid
      @submission.judged = false
      @submission.lang ||= 0
      @submission.save()
      redirect_to submission_path(params[:submission][:qid])
    else
      flash[:alert] = "Code conflict"
      render 'new'
    end
  end
  def show
    @qid = params[:id]
    @submissions = Submission.where("user=? AND qid=?", @current_user.sid, @qid).order('created_at DESC')
  end

end
