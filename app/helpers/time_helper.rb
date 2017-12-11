module TimeHelper
  def exp_time
    Time.parse("11/12/2017 19:00:00").utc
  end
  def game_over?
    !(exp_time.to_i-Time.now.utc.to_i>=0)
  end
end
