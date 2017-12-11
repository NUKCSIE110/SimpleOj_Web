class ScoreboardController < ApplicationController
  before_action :require_login
  def show
    @problems = Problem.count
    $raw_users = User.all
    @users = Array.new
    $raw_users.each do |raw_user|
      $user = Hash.new
      $ac = Array.new
      $user['sid'] = raw_user.sid
      $user['ac_count'] = 0
      for i in 1..@problems
        $_ac = raw_user.ac
        $_ac ||= 0
        $ac[i-1] = ($_ac >> i) & 1
        $user['ac_count'] += $ac[i-1]
      end
      $user['ac'] = $ac
      $user['score'] = raw_user.score
      $user['score'] ||= 0
      @users.push($user)
    end
    @users = @users.sort{|a, b| [b['ac_count'], b['score']] <=> [a['ac_count'], a['score']]}
    #puts @users
  end
end
