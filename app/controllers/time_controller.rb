class TimeController < ApplicationController
  before_action :require_login
  def get
    render json: {"Now"=> Time.now.utc.to_i*1000, "Exp"=> exp_time.to_i*1000}
  end
end
