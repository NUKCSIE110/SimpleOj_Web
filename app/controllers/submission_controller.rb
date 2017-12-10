class SubmissionController < ApplicationController
  before_action :require_login
  require 'digest/md5'
  require 'net/http'
  def new
    @qid = params[:id]
    @qid ||= 1
  end
  def create
    if game_over?
      return
    end
    @uuid = Digest::MD5.hexdigest(params[:submission][:code]+@current_user.sid)
    if !Submission.where("judged=? AND user=?", false, @current_user.sid).first.nil?
      flash[:alert] = "您還有其他程式碼評測中，請稍後再試"
      @qid = params[:id]
      @qid ||= 1
      render 'new'
      return
    end
    if Submission.where("uuid=?", @uuid).first.nil?
      @qid = params[:submission][:qid]
      @submission = Submission.new(params[:submission].permit(:qid, :code, :lang))
      @submission.uuid = @uuid
      @submission.user = @current_user.sid
      @submission.judged = false
      @submission.lang ||= 0
      @submission.save()
      Thread.new do
        uri = URI('http://0.0.0.0:4321/')
        res = Net::HTTP.post_form(uri, 'qid'=>@submission.qid, 'code'=>@submission.code, 'uuid'=>@submission.uuid, 'lang'=>@submission.lang)
        puts res.body
      end
      redirect_to submission_path(params[:submission][:qid])
    else
      flash[:alert] = "請勿傳送一樣的程式碼"
      @qid = params[:id]
      @qid ||= 1
      render 'new'
    end
  end
  def show
    @qid = params[:id]
    @submissions = Submission.where("user=? AND qid=?", @current_user.sid, @qid).order('created_at DESC')
  end
end
